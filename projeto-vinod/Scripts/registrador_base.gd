extends ComponenteBase

# Se controle == '1', saida assume valor de entrada_1. Se controle == '0', nada acontece. 
func agir():
	
	if controle == '0':
		pass
	
	elif controle == '1':
		saida = entrada_1
	
	else:
		print("Erro no MUX: Controle inválido: " + controle)
