class_name MBR extends ComponenteBase

@export var controle_memoria: ControleAcessoMemoria

var rd: String = "0"
var wr: String = "0"
var endereco_memoria: String = "000000000000"

func agir():
	# Pega o dado após ele passar pelo shifter (Barramento C)
	if controle == "1":
		saida = entrada_1
		#print("mbr rodou isso aqui, cade")
	
	# Leitura na memória
	elif rd == "1":
		saida = controle_memoria.acessa_dado(endereco_memoria)
	
	# Escrita na memória
	elif wr == "1":
		print("mbr Esse vai ser o insere: "+entrada_1+" nesse lugar: "+endereco_memoria)
		controle_memoria.insere_dado(saida, endereco_memoria)
	
	#print("mbr saida: "+saida)
	#print("mbr entrada: "+entrada_1)
