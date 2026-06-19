extends ComponenteBase
@export var acesso_memoria_controle : ControleAcessoMemoria;

var amux
var cond
var ula
var desl
var mbr
var mar
var rd
var wr
var enc
var dec_c
var dec_b
var dec_a
var end
	
func agir() -> void:
	
	amux = entrada_1.substr(0,1)
	cond = entrada_1.substr(1,2)
	ula = entrada_1.substr(3,2)
	desl = entrada_1.substr(5,2)
	mbr = entrada_1.substr(7,1)
	mar = entrada_1.substr(8,1)
	rd = entrada_1.substr(9,1)
	wr = entrada_1.substr(10,1)
	enc = entrada_1.substr(11,1)
	dec_c = entrada_1.substr(12,4)
	dec_b = entrada_1.substr(16, 4)
	dec_a = entrada_1.substr(20,4)
	end = entrada_1.substr(24,8)
	
