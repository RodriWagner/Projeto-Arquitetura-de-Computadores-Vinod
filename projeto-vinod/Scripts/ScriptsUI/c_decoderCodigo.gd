extends Area2D

# 1. O alvo que contém a lógica de tela
@export var caixa_de_interface: TextEdit

# 2. O alvo que contém a lógica de dados (o seu Line2D com o barramento.gd)
@export var linha_de_dados: Node2D 

func _ready() -> void:
	mouse_entered.connect(_mostrar_texto)
	mouse_exited.connect(_esconder_texto)

func _mostrar_texto() -> void:
	# Valida se a interface e a linha foram conectadas no Inspetor
	print("oi")
	if caixa_de_interface != null and linha_de_dados != null:
		# Trava de segurança: Garante que a linha tem de onde puxar o dado
		if linha_de_dados.origem != null:
			var valor_trafegando = str(linha_de_dados.origem.saida)
			 
			# Formata e injeta na tela
			caixa_de_interface.text = "Trafegando no Barramento:\nValor: " + valor_trafegando
		else:
			caixa_de_interface.text = "Barramento sem origem definida."
				
func _esconder_texto() -> void:
	if caixa_de_interface != null:
		caixa_de_interface.text = ""


func _on_text_edit_focus_entered() -> void:
	pass # Replace with function body.


func _on_text_edit_focus_exited() -> void:
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	pass # Replace with function body.
