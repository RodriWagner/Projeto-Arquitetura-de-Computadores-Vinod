extends ComponenteBase

func _ready() -> void:
	entrada_1 = "0"
	entrada_2 = "0"
	controle = "11"
	agir()
	print(saida)

func agir():
	
	match controle:
		"00":
			saida = "0"
		"01":
			if entrada_1 == "1": saida = "1"
			else: saida = "0"
		"10":
			if entrada_2 == "1": saida = "1"
			else: saida = "0"
		"11":
			saida = "1"
		_:
			print("Erro no Controle de Fluxo: Controle inválido: " + controle)
