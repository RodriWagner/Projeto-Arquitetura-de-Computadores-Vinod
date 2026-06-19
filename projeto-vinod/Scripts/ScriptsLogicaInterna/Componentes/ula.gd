class_name ULA extends ComponenteBase

var flag_n: String = "0"
var flag_z: String = "0"


func agir():

	match controle:
		"00":
			var a: int = entrada_1.bin_to_int()
			var b: int = entrada_2.bin_to_int()
			var resultado: int = (a + b) & 0xFFFF
			saida = _int_para_bin16(resultado)
			

		"01":
			var a: int = entrada_1.bin_to_int()
			var b: int = entrada_2.bin_to_int()
			saida = _int_para_bin16(a & b)

		"11":
			var a: int = entrada_1.bin_to_int()
			saida = _int_para_bin16((~a) & 0xFFFF)

		"10":
			saida = entrada_2

		_:
			print("Erro ULA: Controle inválido: " + controle)
			return

	_calcular_flags()

func _calcular_flags() -> void:
	flag_n = saida[0]
	print(saida)
	if (saida == "0000000000000000"):
		flag_z = "1"
	else: 
		flag_z = "0"

func _int_para_bin16(valor: int) -> String:
	var resultado: String = ""
	for i in range(16):
		resultado = str(valor & 1) + resultado
		valor >>= 1
	return resultado
