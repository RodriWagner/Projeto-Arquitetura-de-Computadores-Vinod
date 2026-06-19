extends Node

func _ready() -> void:
	var dados = [[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4],[1,2], [3,4] ]
	
	var tabela = Tabela.New(dados)
	print(tabela)

	
	$ScrollContainer/Tabela.dado = tabela
	$ScrollContainer/Tabela.apareceNaTela()
