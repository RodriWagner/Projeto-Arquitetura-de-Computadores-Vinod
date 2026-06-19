extends Resource
class_name Tabela

@export var dados: Array

##construtor
static func New(dado: Array) -> Tabela:
	var tabela = Tabela.new()
	tabela.dados = dado
	return tabela

##getters

func getLinha(i: int):
	return dados[i]

func qtdLinhas():
	return dados.size()

##metodos

func alteraTabela(endereco: int, valor: String):
	dados[endereco][1] = valor

func _to_string() -> String:
	var resultado: String = "" 
	
	for dado in dados:
		resultado = " ".join(dados) + "\n"
	
	return resultado
