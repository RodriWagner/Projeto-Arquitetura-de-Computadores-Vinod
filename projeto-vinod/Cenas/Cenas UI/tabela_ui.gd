extends Control

@onready var linhaTabela = preload("res://Cenas/Cenas UI/linhas_da_tabela.tscn")
@onready var celulaTabela = preload("res://Cenas/Cenas UI/células_da_tabela.tscn")

@export var dado: Tabela

func apareceNaTela():
	if dado:
		var qtd_linhas = dado.qtdLinhas()
		
		for l in range(qtd_linhas):
			var linha = linhaTabela.instantiate()
			$LinhasDaTabela.add_child(linha)
			
			for valor in dado.getLinha(l):
				var celula = celulaTabela.instantiate()
				celula.text = str(valor)
				linha.add_child(celula)
