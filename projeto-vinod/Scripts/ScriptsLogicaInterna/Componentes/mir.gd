extends ComponenteBase

	
func agir() -> void:
	
	var amux = entrada_1.substr(0,1)
	var cond = entrada_1.substr(1,2)
	var ula = entrada_1.substr(3,2)
	var desl = entrada_1.substr(5,2)
	var mbr = entrada_1.substr(7,1)
	var mar = entrada_1.substr(8,1)
	var rd = entrada_1.substr(9,1)
	var wr = entrada_1.substr(10,1)
	var enc = entrada_1.substr(11,1)
	var dec_c = entrada_1.substr(12,4)
	var dec_b = entrada_1.substr(16, 4)
	var dec_a = entrada_1.substr(20,4)
	var end = entrada_1.substr(24,8)
	
