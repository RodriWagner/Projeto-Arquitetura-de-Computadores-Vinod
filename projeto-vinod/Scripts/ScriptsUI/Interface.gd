class_name Interface extends Control

@export_subgroup("Leitor de Macro")
@export var leitor_de_macro : LeitorDeMacro;
@export var leitor_de_texto : TextEdit;

@export_subgroup("Lista de Micros")
@export var imprimidor_de_texto : TextEdit;

@export_subgroup("Memoria Principal")
@export var memoria_principal : MemoriaPrincipal;

@export_subgroup("Gerenciador de Tempo")
@export var gerenciador : Gerenciador;
@export var velocidade_label : Label;

var iniciou : bool = false

func _ready() -> void:
	velocidade_label.text = "TEMPO ENTRE SUBCICLOS: " + str(gerenciador.tempo_entre_subciclos) + "s"


func _on_iniciar_simulação_pressed() -> void:
	# Escreve programa na memória
	var macro_em_binario : PackedStringArray = leitor_de_macro.trata_texto(leitor_de_texto.text)
	if (macro_em_binario.is_empty()):
		leitor_de_texto.text = "Error de escrita ou instrução inválida"
		return
	memoria_principal.escreve_programa_em_memoria(macro_em_binario);
	# Inicia gerenciador de tempo
	gerenciador.timer_dos_subciclos.start(gerenciador.tempo_entre_subciclos)
	iniciou = true


func _on_avança_pressed() -> void:
	if(!gerenciador.timer_ativado):
		gerenciador.atualiza_subciclos();


func _on_pausa_pressed() -> void:
	var pause = $"PanelContainer/HBoxContainer/Botões e Texto/PanelContainer2/VBoxContainer/HBoxContainer3/pausa"
	if(gerenciador.timer_ativado and iniciou):
		gerenciador.ativa_desativa_timer()
		pause.text = "DESPAUSA"
	else:
		gerenciador.ativa_desativa_timer()
		pause.text = "PAUSA"


func _on_aumentar_vel_pressed() -> void:
	gerenciador.aumenta_intervalo_timer()
	velocidade_label.text = "TEMPO ENTRE SUBCICLOS: " + str(gerenciador.tempo_entre_subciclos) + "s"


func _on_diminuir_vel_pressed() -> void:
	gerenciador.decrementa_intervalo_timer()
	velocidade_label.text = "TEMPO ENTRE SUBCICLOS: " + str(gerenciador.tempo_entre_subciclos) + "s"


func _on_voltar_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Cenas UI/menu.tscn")
