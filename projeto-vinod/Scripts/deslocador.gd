extends BlocoBase

func quando_clica_botao(controle : String):
	# Falta pegar dado
	
	# Desloca # Exemplo: '011' -> '0110' -> '110'
	if (controle == '1'):
		# Adiciona o 0 no final
		dado_armazenado = dado1 + '0'
		# Toma a string apenas da posição 1 até o final
		dado1 = dado1.substr(1)
	elif (controle != '0'):
		print("Erro Deslocador: Controle inválido: " + controle)
