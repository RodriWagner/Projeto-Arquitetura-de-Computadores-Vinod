class_name Barramento extends Node2D

#@export var origem : ComponenteBase;
#@export var destino : ComponenteBase;
### Seleciona qual entrada que esse barramento está enviando
#@export_range(1,2) var flag_entrada : int = 1
#
#func _process(_delta: float) -> void:
	#if (flag_entrada == 1):
		#destino.entrada_1 = origem.saida;
	#elif (flag_entrada == 2):
		#destino.entrada_2 = origem.saida;
