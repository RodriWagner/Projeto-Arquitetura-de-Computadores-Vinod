extends Node

@export var interface: Control

func _ready() -> void:
	var dados : Array
	var i := 0;
	while (i<4096):
		dados.append([i, interface.memoria_principal.linhas_da_memoria[i]])
		i+=1;
	
	var tabela = Tabela.New(dados)
	
	$ScrollContainer/Tabela.dado = tabela
	$ScrollContainer/Tabela.apareceNaTela()
