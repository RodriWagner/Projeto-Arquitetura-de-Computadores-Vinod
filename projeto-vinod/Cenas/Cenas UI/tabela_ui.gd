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

func atualizaTabela():
	if dado:
		print("oi")
		var linhas_visiveis = $LinhasDaTabela.get_children()
		var qtd_linhas_dados = dado.qtdLinhas()
		
		var limite = min(linhas_visiveis.size(), qtd_linhas_dados)
		
		for l in range(limite):
			var linha_atual = linhas_visiveis[l]
			var celulas = linha_atual.get_children()
			var valores_atualizados = dado.getLinha(l)
			
			for c in range(min(celulas.size(), valores_atualizados.size())):
				celulas[c].text = str(valores_atualizados[c])
