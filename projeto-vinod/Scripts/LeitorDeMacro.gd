extends Node2D

@export var leitor : TextEdit;

var traducao_opcode : Dictionary = {
		"LOAD" : "0000",
		"STOD" : "0001",
		"ADDD" : "0010",
		"SUBD" : "0011",
		"JPOS" : "0100",
		"JZER" : "0101",
		"JUMP" : "0110",
		"LOCO" : "0111",
		"LODL" : "1000",
		"STOL" : "1001",
		"ADDL" : "1010",
		"SUBL" : "1011",
		"JNEG" : "1100",
		"JNZE" : "1101",
		"CALL" : "1110",
		"PSHI" : "1111000000000000",
		"POPI" : "1111001000000000",
		"PUSH" : "1111010000000000",
		"POP" : "1111011000000000",
		"RETN" : "1111100000000000",
		"SWAP" : "1111101000000000",
		"INSP" : "11111100",
		"DESP" : "11111100"
	}

func decimal_para_binario(numero: int) -> String:
	if numero == 0:
		return "0"
	
	var binario: String = ""
	var temp: int = numero
	
	while temp > 0:
		# Adiciona o bit menos significativo à esquerda da string
		binario = str(temp & 1) + binario
		# Desloca os bits para a direita
		temp = temp >> 1
		
	return binario

## Limpa os espaços do inicio e final de cada linha. 
## Retorna a lista limpa.
func limpa_espacos(texto_em_linhas : PackedStringArray) -> PackedStringArray:
	var i : int = 0;
	var tam_lista : int = texto_em_linhas.size();
	while (i < tam_lista):
		texto_em_linhas[i] = texto_em_linhas[i].strip_edges();
		i+=1;
	return texto_em_linhas;

## Retorna uma lista de dicionarios que armazena a linha que está a label
## usando a label como chave.
## exemplo: {"else" : 10} que dizer que quando pular para else, pula pra linha 10.
func _armazena_labels(texto_em_linhas : PackedStringArray) -> Array[Dictionary]:
	var lista_de_labels : Array[Dictionary] = [];
	
	# varre a as linhas do texto individualmente
	var i : int = 0;
	var tam_texto : int = texto_em_linhas.size();
	while (i<tam_texto):
		var linha : PackedStringArray = texto_em_linhas[i].split(":");
		# se tiver label, vai estar separado por ":", logo, o tamanho de linha > 1
		if (linha.size() > 1):
			# faz um dicionario que armazena a linha do label de acordo com seu nome
			# exemplo: {"else" : 10} que dizer que quando pular para else, pula pra linha 10.
			var novo_label := {linha[0] : i};
			lista_de_labels.append(novo_label);
		i+=1;
		
	return lista_de_labels;

## Remove os labels para tratar apenas o código.
func _remove_labels(texto_em_linhas : PackedStringArray, lista_de_labels : Array[Dictionary]) -> PackedStringArray:
	# Varre as linhas que tem label para remove-los
	var tam_label : int = lista_de_labels.size();
	var i : int = 0;
	while (i<tam_label):
		var label : Dictionary = lista_de_labels[i];
		# pega o nome do label
		var endereco : String = label.keys()[0];
		# busca no endereco do label (endereco) e exclui o label
		var aux = texto_em_linhas[label[endereco]].split(":");
		#se tem label, remove
		if (aux.size() > 1):
			texto_em_linhas[label[endereco]] = aux[1];
		i+=1;
	return texto_em_linhas;

## Transforma instrução em binario de acordo com seu nome.
## Conteudo é a variavel do que ela usa. Jumps usam enderecos de linha e ADDD usam numeros, por exemplo.
## O conteudo é transformado em binario e adicionado ao opcode.
## A instrução completa é retornado em formato de string.
func _instrucao_binario(instrucao : String, conteudo : String, lista_de_labels : Array[Dictionary]) -> String:
	if (conteudo.is_valid_int()):
		var conteudo_binario : String = decimal_para_binario(int(conteudo));
		var instrucao_binario : String = traducao_opcode[instrucao];
		var zero_faltando = 16 - instrucao_binario.length() - conteudo_binario.length();
		if (zero_faltando > 0):
			conteudo_binario = "0".repeat(zero_faltando) + conteudo_binario;
		elif (zero_faltando < 0):
			print("Numero grande demais")
		var instrucao_completa = instrucao_binario + conteudo_binario;
		return instrucao_completa;
	return traducao_opcode[instrucao];

## Função responsável por tratar todo o texto em Macro Instrução inserido pelo usuário.
## Transforma a escrita humana em binário para o resto do sistema usar.
func trata_texto() -> PackedStringArray:
	# recebe o texto
	var texto : String = leitor.text;
	if (texto == ""):
		return [];
		
	# separa o texto em linhas
	var texto_em_linhas : PackedStringArray = limpa_espacos(texto.split("\n"));
	# guarda aonde estarão os pulos
	var lista_de_labels : Array[Dictionary] = _armazena_labels(texto_em_linhas);
	# remove os labels para passarmos a tratar do código
	texto_em_linhas = _remove_labels(texto_em_linhas, lista_de_labels);
	
	var lista_de_binario : PackedStringArray = [];
	for i in texto_em_linhas:
		var instrucao := i.split(" ");
		# Se não tiver passando parametro quer dizer que, em binário, não tem conteudo (situações como push e pop)
		if (instrucao.size()>1):
			lista_de_binario.append(_instrucao_binario(instrucao[0], instrucao[1], lista_de_labels));
		else:
			lista_de_binario.append(_instrucao_binario(instrucao[0], "", lista_de_labels));
	
	# retorna a lista de instruções (so que em binário)
	return lista_de_binario;
