extends Control

@export_subgroup("Leitor de Macro")
@export var leitor_de_macro : LeitorDeMacro;
@export var leitor_de_texto : TextEdit;

@export_subgroup("Memoria Principal")
@export var memoria_principal : MP;

func _on_iniciar_simulação_pressed() -> void:
	memoria_principal.escreve_programa_em_memoria(leitor_de_macro.trata_texto(leitor_de_texto.text));
	print(memoria_principal.linhas_da_mp);
