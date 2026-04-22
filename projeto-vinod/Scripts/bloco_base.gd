class_name BlocoBase extends Node2D

# Blocos que só recebem 1 dado mantem o dado 2 vazio.
## Dado recebido 1
var dado1 : String = ""
## Dado recebido 2
var dado2 : String = ""

## Dado que esse bloco irá enviar para os outros blocos
@export var dado_armazenado : String = ""

# Essa função vai estar conectada a um sinal q será emitido pelo botão
func quando_clica_botao(controle : String):
	# Pega dado
	# Processa
	# Armazena
	pass
