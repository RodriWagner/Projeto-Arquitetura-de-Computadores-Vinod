extends ComponenteBase

#recebe 16 bits do barramento c e tem como saída o endereço da memória (12 bits)
func agir():
	saida = entrada_1.substr(4)
