extends Node2D

## Subciclo atual. Varia entre 1 e 4.
@export_range(1, 4) var subciclo : int = 1

@export_group("Timer dos Ciclos")
@export var timer_ativado : bool = false
@export var timer_dos_ciclos : Timer
@export var tempo_entre_ciclos : float = 2

## Incrementa o subciclo em 1 unicade levando em conta que
## ao incrementar o quarto subciclo, ele volta para o primeiro
func incrementa_subciclo(novo_subciclo : int):
	if novo_subciclo < 4:
		novo_subciclo += 1
	else:
		novo_subciclo = 1
	return novo_subciclo

## Função chamada toda vez que um subciclo é atualizado.
func atualiza_subciclos():
	match subciclo:
		1:
			print(subciclo)
		2:
			print(subciclo)
		3:
			print(subciclo)
		4:
			print(subciclo)
	subciclo = incrementa_subciclo(subciclo);

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
		timer_dos_ciclos.stop()
	else:
		timer_ativado = true
		timer_dos_ciclos.start(tempo_entre_ciclos)
