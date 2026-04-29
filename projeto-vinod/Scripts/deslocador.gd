extends ComponenteBase

func clock():
	# Desloca # Exemplo: '011' -> '0110' -> '110'
	if (controle == '1'):
		# Adiciona o 0 no final
		saida = entrada_1 + '0'
		# Toma a string apenas da posição 1 até o final
		entrada_1 = entrada_1.substr(1)
	elif (controle != '0'):
		print("Erro Deslocador: Controle inválido: " + controle)
