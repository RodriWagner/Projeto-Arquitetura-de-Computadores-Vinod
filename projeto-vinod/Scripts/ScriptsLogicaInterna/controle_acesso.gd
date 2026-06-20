class_name ControleAcessoMemoria extends Node2D

@export var memoria : Memoria;
@export_range(12,32) var tamanho_base_endereco : int = 12

func _limpa_endereco_de_acesso(endereco : String) -> String:
	var tam_endereco := endereco.length()
	if (endereco.length() > tamanho_base_endereco):
		return endereco.substr(tam_endereco-tamanho_base_endereco)
	return endereco

## Retorna, em string, o dado presente no endereço passado.
## Se o endereço estiver vazio, na memória principal isso é uma linha de zeros e, por conseguinte,
## essa função retornará uma linha de zeros.
func acessa_dado(endereco : String) -> String:
	endereco = _limpa_endereco_de_acesso(endereco)
	if (get_parent().name == "MemoriaPrincipal"): print("controle_acesso valor acessado: "+memoria.linhas_da_memoria[endereco.bin_to_int()])
	return memoria.linhas_da_memoria[endereco.bin_to_int()];

## Insere dado no endereco passado
func insere_dado(dado : String, endereco : String) -> void:
	endereco = _limpa_endereco_de_acesso(endereco)
	print(memoria.linhas_da_memoria)
	memoria.linhas_da_memoria[endereco.bin_to_int()] = dado;
