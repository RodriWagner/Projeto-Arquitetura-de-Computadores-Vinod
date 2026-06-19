class_name ControleAcessoMemoria extends Node2D

@export var memoria : Memoria;

## Retorna, em string, o dado presente no endereço passado.
## Se o endereço estiver vazio, na memória principal isso é uma linha de zeros e, por conseguinte,
## essa função retornará uma linha de zeros.
func acessa_dado(endereco : String) -> String:
	return memoria.linhas_da_memoria[endereco.bin_to_int()];

## Insere dado no endereco passado
func insere_dado(dado : String, endereco : String) -> void:
	memoria.linhas_da_memoria[endereco.bin_to_int()] = dado;
