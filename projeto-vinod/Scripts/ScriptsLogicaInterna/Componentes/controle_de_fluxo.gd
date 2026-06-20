extends ComponenteBase

@export var ula : ULA

@export var MMUX : ComponenteBase

func _ready() -> void:
	controle = "00"


func agir():
	match controle:
		"00":
			saida = "0"
		"01":
			if ula.flag_n == "1":
				saida = "1"
			else:
				saida = "0"
		"10":
			if ula.flag_z == "1":
				saida = "1"
			else:
				saida = "0"
			
		"11":
			saida = "1"
		_:
			print("Erro no Controle de Fluxo: Controle inválido: " + controle)
	
	if (MMUX):
		MMUX.controle = saida
		print(MMUX.controle)
	else:
		print("MMUX está null no controle de fluxo")
