extends Control




func _on_sair_pressed() -> void:
	get_tree().quit()


func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Cenas de lógica interna/main.tscn")


func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Cenas UI/creditos.tscn")
