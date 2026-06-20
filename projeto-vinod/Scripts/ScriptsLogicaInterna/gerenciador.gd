class_name Gerenciador extends Node2D

## Subciclo atual. Varia entre 1 e 4.
@export_range(1, 4) var subciclo : int = 1

@export_group("Timer dos Ciclos")
@export var timer_ativado : bool = false
@export var timer_dos_subciclos : Timer
@export var tempo_entre_subciclos : float = 2
@export var tempo_entre_subciclos_min : float = 0.5
@export var tempo_entre_subciclos_max : float = 3.0
var mudanca_de_tempo : float = 0.25

@export_group("Componentes")
@export var lista_de_componentes : Dictionary[String, ComponenteBase]

## Incrementa o subciclo em 1 unicade levando em conta que
## ao incrementar o quarto subciclo, ele volta para o primeiro
func _incrementa_subciclo(novo_subciclo : int):
	if novo_subciclo < 4:
		novo_subciclo += 1
	else:
		novo_subciclo = 1
	return novo_subciclo

## Função chamada toda vez que um subciclo é atualizado.
func atualiza_subciclos():
	match subciclo:
		1:
			# Envia controles
			lista_de_componentes["MIR"].agir()
		2:
			# Carrega Lacths A e B
			lista_de_componentes["LatchA"].agir()
			lista_de_componentes["LatchB"].agir()
		3:
			lista_de_componentes["MAR"].agir()
		4:
			# Habilita saída do MPC
			lista_de_componentes["MPC"].agir()
			# Grava dado do Deslocador (que estaria Barramento C) no registrador indicado (a depender do EnC)
			lista_de_componentes["DecoderC"].atualiza_em_c()
			# MBR pega dado para ser gravado na memória
			lista_de_componentes["MBR"].agir()
	subciclo = _incrementa_subciclo(subciclo);


func ativa_desativa_timer() -> void:
	if timer_ativado:
		timer_ativado = false
		timer_dos_subciclos.stop()
	else:
		timer_ativado = true
		timer_dos_subciclos.start(tempo_entre_subciclos)

func decrementa_intervalo_timer():
	if (tempo_entre_subciclos > tempo_entre_subciclos_min):
		tempo_entre_subciclos -= mudanca_de_tempo
	else:
		tempo_entre_subciclos = tempo_entre_subciclos_min
	
func aumenta_intervalo_timer():
	if (tempo_entre_subciclos < tempo_entre_subciclos_max):
		tempo_entre_subciclos += mudanca_de_tempo
	else:
		tempo_entre_subciclos = tempo_entre_subciclos_max
