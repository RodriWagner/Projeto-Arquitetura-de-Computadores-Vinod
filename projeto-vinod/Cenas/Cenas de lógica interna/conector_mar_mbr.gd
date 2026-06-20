extends Node2D
@export var mar : ComponenteBase
@export var mbr : MBR

func _process(delta: float) -> void:
	#print("concmarmbr mbr_init_end: "+mbr.endereco_memoria)
	mbr.endereco_memoria = mar.saida
	#print("concmarmbr mbr_final_end: "+mbr.endereco_memoria)
