extends Control

@export var MacroInstrucao : VBoxContainer
@export var MicroInstrucao : VBoxContainer

#troca entre microinstrucao e macroinstrucao
func _on_seta_esq_pressed() -> void:
	
	if (MicroInstrucao.visible == true):
		MicroInstrucao.visible = false
		MacroInstrucao.visible = true
	else:
		MicroInstrucao.visible = true
		MacroInstrucao.visible = false


#troca entre microinstrucao e macroinstrucao
func _on_seta_dir_pressed() -> void:
	
	if (MicroInstrucao.visible == true):
		MicroInstrucao.visible = false
		MacroInstrucao.visible = true
	else:
		MicroInstrucao.visible = true
		MacroInstrucao.visible = false
