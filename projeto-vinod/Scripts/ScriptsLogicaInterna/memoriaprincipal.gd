class_name MemoriaPrincipal extends Memoria

var linhas_da_memoria : PackedStringArray = []
@export var tabela_ui : Control
## Inicia cada linha da memória principal como uma linha vazia.
func _cria_memoria_vazia():
	var i := 0;
	while (i<4096):
		linhas_da_memoria.append("0000000000000000");
		i+=1;


## Escreve o macro programa (em binário) na memória principal 
func escreve_programa_em_memoria(macros_em_binario : PackedStringArray, inicio : int = 0):
	var tam_programa := macros_em_binario.size();
	var i : int = inicio;
	
	while (i<tam_programa):
		linhas_da_memoria[i] = macros_em_binario[i];
		tabela_ui.dado.alteraTabela(i, macros_em_binario[i])
		i+=1;
	tabela_ui.atualizaTabela()

func _init() -> void:
	
	_cria_memoria_vazia();
