class_name MBR extends ComponenteBase

@export var controle_memoria: ControleAcessoMemoria

var mbr: String = "0"
var rd: String = "0"
var wr: String = "0"
var endereco_memoria: String = "0000000000000000"

func agir():
	# Pega o dado após ele passar pelo shifter (Barramento C)
	if mbr == "1":
		saida = entrada_1
	
	# Leitura na memória
	if rd == "1":
		saida = controle_memoria.acessa_dado(endereco_memoria)
	
	# Escrita na memória
	if wr == "1":
		controle_memoria.insere_dado(saida, endereco_memoria)
