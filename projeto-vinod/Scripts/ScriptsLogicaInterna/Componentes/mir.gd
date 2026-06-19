extends ComponenteBase
@export var acesso_memoria_controle : ControleAcessoMemoria;
@export var mpc : ComponenteBase

@export var amux : ComponenteBase
@export var cond : ComponenteBase
@export var ula : ComponenteBase
@export var desl : ComponenteBase
@export var mbr : ComponenteBase
@export var mar : ComponenteBase
@export var rd : ComponenteBase
@export var wr : ComponenteBase
@export var enc : ComponenteBase
@export var dec_c : ComponenteBase
@export var dec_b : ComponenteBase
@export var dec_a : ComponenteBase
@export var addr : ComponenteBase
	
func agir() -> void:
	entrada_1 = acesso_memoria_controle.acessa_dado(mpc.saida)
	
	amux.controle = entrada_1.substr(0,1)
	cond.controle = entrada_1.substr(1,2)
	ula.controle = entrada_1.substr(3,2)
	desl.controle = entrada_1.substr(5,2)
	mbr.controle = entrada_1.substr(7,1)
	mar.controle = entrada_1.substr(8,1)
	rd.rd = entrada_1.substr(9,1)
	wr.wr = entrada_1.substr(10,1)
	enc.controle = entrada_1.substr(11,1)
	dec_c.entrada_1 = entrada_1.substr(12,4)
	dec_b.entrada_1 = entrada_1.substr(16, 4)
	dec_a.entrada_1 = entrada_1.substr(20,4)
	addr.entrada_2 = entrada_1.substr(24,8)
	
