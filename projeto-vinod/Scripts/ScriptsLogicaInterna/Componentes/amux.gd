class_name AMUX extends ComponenteBase

func agir():
	# Dependendo do controle, seleciona uma saída (0 - dado 1, 1 - dado 2);
	if (controle == '0'):
		saida = entrada_1
		
	elif (controle == '1'):
		saida = entrada_2
		#print("amux "+entrada_2)
	else:
		print("Erro no MUX: Controle inválido: " + controle)
	
	
