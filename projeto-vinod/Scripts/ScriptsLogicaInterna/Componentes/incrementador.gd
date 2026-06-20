extends ComponenteBase

func agir():
	
	if controle == '0':
		saida = entrada_1
	
	elif controle == '1':
		var temp: int = entrada_1.bin_to_int()
		temp += 1
		
		var result: String = ""
		while temp > 0:
			result = str(temp & 1) + result
			temp = temp >> 1
		
		while (result.length() < 32):
			result = "0" + result;
		
		if result.length() == 33:
			result = result.substr(1)
				
		saida = result
	
	else:
		print("Erro no incrementador: Controle inválido: " + controle)
