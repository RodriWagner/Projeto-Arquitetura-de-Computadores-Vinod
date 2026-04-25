extends BlocoBase

func quando_clica_botao(controle : String):
	# pegar dado
	pega_dados()
	
	# Dependendo do controle, seleciona uma saída (0 - dado 1, 1 - dado 2);
	if (controle == '0'):
		dado_armazenado = dado1
	elif (controle == '1'):
		dado_armazenado = dado2
	else:
		print("Erro no MUX: Controle inválido: " + controle)
