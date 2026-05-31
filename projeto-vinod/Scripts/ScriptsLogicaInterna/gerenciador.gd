class_name Gerenciador extends Node2D

## Subciclo atual. Varia entre 1 e 4.
@export_range(1, 4) var subciclo : int = 1

@export_group("Timer dos Ciclos")
@export var timer_ativado : bool = false
@export var timer_dos_subciclos : Timer
@export var tempo_entre_subciclos : float = 2

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
			# AMUX está sempre ativo, mas ativamos por código para otimizar simulação
			lista_de_componentes["MAR"].agir()
		4:
			# Habilita saída do MPC
			lista_de_componentes["MPC"].agir()
			# Grava dado do barramento C no registrador indicado (a depender do EnC)
			lista_de_componentes["DecoderC"].agir()
			# MBR pega dado para ser gravado na memória
			lista_de_componentes["MBR"].agir()
	subciclo = _incrementa_subciclo(subciclo);

## Função chamada toda vez que um ciclo é atualizado.
## Responsável fazer subciclos em frames diferentes e seguidos, compondo um ciclo.
func atualiza_ciclos():
	atualiza_subciclos()
	atualiza_subciclos()
	atualiza_subciclos()
	atualiza_subciclos()


func _ativa_desativa_timer() -> void:
	if timer_ativado:
		timer_ativado = false
		timer_dos_subciclos.stop()
	else:
		timer_ativado = true
		timer_dos_subciclos.start(tempo_entre_subciclos)
