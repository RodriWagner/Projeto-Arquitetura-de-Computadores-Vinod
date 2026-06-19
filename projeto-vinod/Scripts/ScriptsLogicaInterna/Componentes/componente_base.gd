class_name ComponenteBase extends Node2D

# Componentes que só recebem 1 dado mantem o dado 2 vazio.
## Dado recebido 1.
## Um barramento irá enviar esse dado.
var entrada_1 : String = "0"
## Dado recebido 2.
## Um barramento irá enviar esse dado.
var entrada_2 : String = "0"

## Controle
var controle : String = "0"

@export var clocked : bool = false;

## Dado que esse bloco irá enviar para os outros componentes.
## Ela será pega pelos barramentos e enviada para outros componentes.
@export var saida : String = "0"

## Essa função vai ser chamada quando o agir ativar esse componente
## É dever essa função, a partir de um controle, executar a seguinte lista:
## 1) Processar dado(s) de entrada
## 2) Armazenar um dado em "saida"
func agir():
	# Processa
	# Armazena
	pass


func _process(_delta: float) -> void:
	if (!clocked):
		agir();
