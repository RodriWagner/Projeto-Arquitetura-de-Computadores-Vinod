class_name ControleAcessoMP extends Node2D

@export var memoria_principal : MP;

## Retorna, em string, o dado presente no endereço passado.
## Se o endereço estiver vazio, na memória principal isso é uma linha de zeros e, por conseguinte,
## essa função retornará uma linha de zeros.
func acessa_dado(endereco : String) -> String:
	return memoria_principal.linhas_da_mp[endereco.bin_to_int()];

## Insere dado no endereco passado
func insere_dado(dado : String, endereco : String) -> void:
	memoria_principal.linhas_da_mp[endereco.bin_to_int()] = dado;
