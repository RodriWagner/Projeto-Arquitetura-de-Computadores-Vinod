extends ComponenteBase

func agir():
	
	if controle == '0':
		saida = "0000000000000000"
	
	elif controle == '1':
		
		var temp: int = entrada_1.bin_to_int()
		saida = ""
		
		for i in temp:
			saida = "0" + saida
		saida = "1" + saida
		for i in range(temp+1, 16):
			saida = "0" + saida
	
	else:
		print("Erro no decoder: Controle inválido: " + controle)
