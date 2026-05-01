extends ComponenteBase

func clock():
	# Sem deslocamento
	if (controle == "00"):
		saida = entrada_1
	# Deslocamento à direita # Exemplo: '011' -> '0110' -> '110'
	elif (controle == "01"):
		# Adiciona o 0 no final
		var aux_1 = entrada_1 + '0'
		# Toma a string apenas da posição 1 até o final
		saida = aux_1.substr(1)
	# Deslocamento à esquerda # Exemplo: '010' -> '0010' -> '001'
	elif (controle == '10'):
		# Adiciona o 0 no começo
		var aux_1 = '0' + entrada_1
		# Toma a string apenas da posição 0 até penultimo
		saida = aux_1.substr(0, -2)
	else:
		print("Erro Deslocador: Controle inválido: " + controle)
		
