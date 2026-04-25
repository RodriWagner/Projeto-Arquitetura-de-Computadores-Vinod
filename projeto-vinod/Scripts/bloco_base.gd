class_name BlocoBase extends Node2D

# Blocos que só recebem 1 dado mantem o dado 2 vazio.
## Dado recebido 1
var dado1 : String = ""
## Dado recebido 2
var dado2 : String = ""
## nó de onde vem o dado1. Vai ser colocado via inspetor (aba lateral dentro da GODOT)
@export var fonte_do_dado1 : BlocoBase = null
## nó de onde vem o dado2. Vai ser colocado via inspetor (aba lateral dentro da GODOT)
@export var fonte_do_dado2 : BlocoBase = null


## Dado que esse bloco irá enviar para os outros blocos
@export var dado_armazenado : String = ""

## Função que pega os dados e armazena nas variaveis dado1 e dado2. Não é estritamente necessária.
## Pode-se pegar os dados direto da fonte.
## (DEVE ser chamada em todas os blocos individualmente caso queria utilizar as variaveis dado1 e dado2)
func pega_dados():
	# Pega dado
	if fonte_do_dado1 != null:
		dado1 = fonte_do_dado1.dado_armazenado
	if fonte_do_dado2 != null:
		dado2 = fonte_do_dado2.dado_armazenado

## Essa função vai estar conectada a um sinal q será emitido pelo botão
## É dever essa função, a partir de um controle, executar a seguinte lista:
## 1) Pegar dado
## 2) Processa dado 
## 3) Armazena dado em dado_armazenado
func quando_clica_botao(controle : String):
	# Pega dado (DEVE ser chamada em todas os blocos individualmente caso queria utilizar as variaveis dado1 e dado2).
	pega_dados()
	# Processa
	# Armazena
	pass
