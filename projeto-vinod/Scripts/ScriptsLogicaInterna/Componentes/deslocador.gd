extends ComponenteBase
 
func agir():
	# Sem deslocamento
	if (controle == "00"):
		saida = entrada_1
	# Deslocamento à direita (divide por 2, perde o LSB original, zero entra no MSB)
	elif (controle == "01"):
		# Adiciona o 0 no começo
		var aux_1 = '0' + entrada_1
		# Toma a string apenas da posição 0 até o penúltimo
		saida = aux_1.substr(0, aux_1.length() - 1)
	# Deslocamento à esquerda (multiplica por 2, perde o MSB original, zero entra no LSB)
	elif (controle == '10'):
		# Adiciona o 0 no final
		var aux_1 = entrada_1 + '0'
		# Toma a string apenas da posição 1 até o final
		saida = aux_1.substr(1)
	else:
		print("Erro Deslocador: Controle inválido: " + controle)
		
