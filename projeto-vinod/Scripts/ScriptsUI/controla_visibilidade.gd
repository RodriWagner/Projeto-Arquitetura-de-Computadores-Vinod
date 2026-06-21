extends Control

@export var MacroInstrucao : VBoxContainer
@export var MicroInstrucao : VBoxContainer
@export var MemoriaPrincipal_UI : VBoxContainer

var cont = 0

func _on_seta_esq_pressed() -> void:
	
	if cont % 3 == 0:
		MemoriaPrincipal_UI.visible = false
		MicroInstrucao.visible = true
		MacroInstrucao.visible = false
	elif cont % 3 == 1:
		MemoriaPrincipal_UI.visible = true
		MicroInstrucao.visible = false
		MacroInstrucao.visible = false
	elif cont % 3 == 2:
		MemoriaPrincipal_UI.visible = false
		MicroInstrucao.visible = false
		MacroInstrucao.visible = true
	
	cont += 1
  
	

func _on_seta_dir_pressed() -> void:
	if cont % 3 == 0:
		MemoriaPrincipal_UI.visible = false
		MicroInstrucao.visible = true
		MacroInstrucao.visible = false
	elif cont % 3 == 1:
		MemoriaPrincipal_UI.visible = true
		MicroInstrucao.visible = false
		MacroInstrucao.visible = false
	elif cont % 3 == 2:
		MemoriaPrincipal_UI.visible = false
		MicroInstrucao.visible = false
		MacroInstrucao.visible = true
	
	cont += 1
