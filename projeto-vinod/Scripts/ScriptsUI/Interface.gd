extends Control

@export_subgroup("Leitor de Macro")
@export var leitor_de_macro : LeitorDeMacro;
@export var leitor_de_texto : TextEdit;

@export_subgroup("Memoria Principal")
@export var memoria_principal : MP;

@export_subgroup("Gerenciador de Tempo")
@export var gerenciador : Gerenciador;
@export var velocidade_label : Label;

var iniciou : bool = false

func _ready() -> void:
	velocidade_label.text = "TEMPO ENTRE SUBCICLOS: " + str(gerenciador.tempo_entre_subciclos) + "s"

func _on_iniciar_simulação_pressed() -> void:
	# Escreve programa na memória
	memoria_principal.escreve_programa_em_memoria(leitor_de_macro.trata_texto(leitor_de_texto.text));
	# Inicia gerenciador de tempo
	gerenciador.timer_dos_subciclos.start()
	iniciou = true


func _on_avança_pressed() -> void:
	if(!gerenciador.timer_ativado):
		gerenciador.atualiza_subciclos();


func _on_pausa_pressed() -> void:
	var pause = $"PanelContainer/HBoxContainer/Botões e Texto/PanelContainer2/VBoxContainer/HBoxContainer3/pausa"
	if(gerenciador.timer_ativado and iniciou):
		gerenciador.timer_ativado = false
		pause.text = "DESPAUSA"
	else:
		gerenciador.timer_ativado = true
		pause.text = "PAUSA"


func _on_aumentar_vel_pressed() -> void:
	gerenciador.aumenta_intervalo_timer()
	velocidade_label.text = "TEMPO ENTRE SUBCICLOS: " + str(gerenciador.tempo_entre_subciclos) + "s"


func _on_diminuir_vel_pressed() -> void:
	gerenciador.decrementa_intervalo_timer()
	velocidade_label.text = "TEMPO ENTRE SUBCICLOS: " + str(gerenciador.tempo_entre_subciclos) + "s"
