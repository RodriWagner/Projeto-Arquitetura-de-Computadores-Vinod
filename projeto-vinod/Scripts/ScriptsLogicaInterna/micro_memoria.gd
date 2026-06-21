class_name MicroMemoria extends Memoria

var linhas_da_memoria: PackedStringArray = []
var micro_da_linha: PackedStringArray = []
## Microinstrução lida após agir() ser chamado.
## O gerenciador lê este dicionário e distribui os campos de controle.



## Recebe o endereço em entrada_1 (string binária de 8 bits),
## busca a microinstrução correspondente e armazena em instrucao_atual.
func agir() -> void:
	return

## Retorna o dicionário da microinstrução pelo nome, ou vazio se não achar.
## Útil para debug.


func _ready() -> void:
	# Mapeamento dos registradores (0 a 15):
	# 0000 = PC    0100 = TIR    1000 = AMASK    1100 = C
	# 0001 = AC    0101 = 0      1001 = SMASK    1101 = D
	# 0010 = SP    0110 = +1     1010 = A        1110 = E
	# 0011 = IR    0111 = -1     1011 = B        1111 = F

	# Mapeamento da ULA: 00=SOMA, 01=AND, 10=PASSA A, 11=NOT A

	# 0: mar:=pc; rd;
	linhas_da_memoria.append("00010000110000000000000000000000")
	micro_da_linha.append("0: mar:=pc; rd;")
		#"name": "mar := pc; rd",
		
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0000", "A": "0000",
		#"ADDR": "00000000"
	

	# 1: pc:=pc + 1; rd;
	linhas_da_memoria.append("00000000010100000110000000000000")
	micro_da_linha.append("1: pc:=pc + 1; rd;")
		#"name": "pc := pc + 1; rd",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "1",
		#"C": "0000", "B": "0110", "A": "0000",
		#"ADDR": "00000000"
	

	# 2: ir:=mbr; if n then goto 28;
	linhas_da_memoria.append("10110000000100110101010100011100")
	micro_da_linha.append("2: ir:=mbr; if n then goto 28;")
		#"name": "ir := mbr; if n then goto 28",
		#"AMUX": "1", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0011", "B": "0101", "A": "0101",
		#"ADDR": "00011100"
	

	# 3: tir:=lshift(ir + ir); if n then goto 19;
	linhas_da_memoria.append("00100100000101000011001100010011")
	micro_da_linha.append("3: tir:=lshift(ir + ir); if n then goto 19;")
		#"name": "tir := lshift(ir + ir); if n then goto 19",
		#"AMUX": "0", "COND": "01", "ULA": "00", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0011", "A": "0011",
		#"ADDR": "00010011"
	

	# 4: tir:=lshift(tir); if n then goto 11;
	linhas_da_memoria.append("00110100000101000101010000001011")
	micro_da_linha.append("4: tir:=lshift(tir); if n then goto 11;")
		#"name": "tir := lshift(tir); if n then goto 11",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "00001011"
	

	# 5: alu:=tir; if n then goto 9;
	linhas_da_memoria.append("00110000000000000101010000001001")
	micro_da_linha.append("5: alu:=tir; if n then goto 9;")
		#"name": "alu := tir; if n then goto 9",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00001001"
	

	# 6: mar:=ir; rd;
	linhas_da_memoria.append("00010000110000000011010100000000")
	micro_da_linha.append("6: mar:=ir; rd;")
		#"name": "mar := ir; rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0011", "A": "0101",
		#"ADDR": "00000000"
	

	# 7: rd;
	linhas_da_memoria.append("00010000010000000101010100000000")
	micro_da_linha.append("7: rd;")
		#"name": "rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 8: ac:=mbr; goto 0;
	linhas_da_memoria.append("11110000000100010101010100000000")
	micro_da_linha.append("8: ac:=mbr; goto 0;")
		#"name": "ac := mbr; goto 0",
		#"AMUX": "1", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0001", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 9: mar:=ir; mbr:=ac; wr;
	linhas_da_memoria.append("00010001101000000011000100000000")
	micro_da_linha.append("9: mar:=ir; mbr:=ac; wr;")
		#"name": "mar := ir; mbr := ac; wr",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "1", "MAR": "1", "RD": "0", "WR": "1", "ENC": "0",
		#"C": "0000", "B": "0011", "A": "0001",
		#"ADDR": "00000000"
	

	# 10: wr; goto 0;
	linhas_da_memoria.append("01110000001000000101010100000000")
	micro_da_linha.append("10: wr; goto 0;")
		#"name": "wr; goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "1", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 11: alu:=tir; if n then goto 15;
	linhas_da_memoria.append("00110000000000000101010000001111")
	micro_da_linha.append("11: alu:=tir; if n then goto 15;")
		#"name": "alu := tir; if n then goto 15",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00001111"
	

	# 12: mar:=ir; rd;
	linhas_da_memoria.append("00010000110000000011010100000000")
	micro_da_linha.append("12: mar:=ir; rd;")
		#"name": "mar := ir; rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0011", "A": "0101",
		#"ADDR": "00000000"
	

	# 13: rd;
	linhas_da_memoria.append("00010000010000000101010100000000")
	micro_da_linha.append("13: rd;")
		#"name": "rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 14: ac:=mbr + ac; goto 0;
	linhas_da_memoria.append("11100000000100010001010100000000")
	micro_da_linha.append("14: ac:=mbr + ac; goto 0;")
		#"name": "ac := mbr + ac; goto 0",
		#"AMUX": "1", "COND": "11", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0001", "B": "0001", "A": "0101",
		#"ADDR": "00000000"
	

	# 15: mar:=ir; rd;
	linhas_da_memoria.append("00010000110000000011010100000000")
	micro_da_linha.append("15: mar:=ir; rd;")
		#"name": "mar := ir; rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0011", "A": "0101",
		#"ADDR": "00000000"


	# 16: rd;
	linhas_da_memoria.append("00010000010000000101010100000000")
	micro_da_linha.append("16: rd;")
		#"name": "rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 17: a:=inv(mbr);
	linhas_da_memoria.append("10011000000110100101010100000000")
	micro_da_linha.append("17: a:=inv(mbr);")
		#"name": "a := inv(mbr)",
		#"AMUX": "1", "COND": "00", "ULA": "11", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 18: ac:=ac + a; goto 0;
	linhas_da_memoria.append("01100000000100011010000100000000")
	micro_da_linha.append("18: ac:=ac + a; goto 0;")
		#"name": "ac := ac + a; goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0001", "B": "1010", "A": "0001",
		#"ADDR": "00000000"
	

	# 19: tir:=lshift(tir); if n then goto 25;
	linhas_da_memoria.append("00110100000101000101010000011001")
	micro_da_linha.append("19: tir:=lshift(tir); if n then goto 25;")
		#"name": "tir := lshift(tir); if n then goto 25",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "00011001"
	

	# 20: alu:=tir; if n then goto 23;
	linhas_da_memoria.append("00110000000000000101010000010111")
	micro_da_linha.append("20: alu:=tir; if n then goto 23;")
		#"name": "alu := tir; if n then goto 23",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00010111"
	

	# 21: alu:=ac; if n then goto 0;
	linhas_da_memoria.append("00110000000000000101000100000000")
	micro_da_linha.append("21: alu:=ac; if n then goto 0;")
		#"name": "alu := ac; if n then goto 0",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0001",
		#"ADDR": "00000000"


	# 22: pc:=band(ir,amask); goto 0;
	linhas_da_memoria.append("01101000000100001000001100000000")
	micro_da_linha.append("22: pc:=band(ir,amask); goto 0;")
		#"name": "pc := band(ir,amask); goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "01", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0000", "B": "1000", "A": "0011",
		#"ADDR": "00000000"
	

	# 23: alu:=ac; if z then goto 22;
	linhas_da_memoria.append("01010000000000000101000100010110")
	micro_da_linha.append("23: alu:=ac; if z then goto 22;")
		#"name": "alu := ac; if z then goto 22",
		#"AMUX": "0", "COND": "10", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0001",
		#"ADDR": "00010110"
	

	# 24: goto 0;
	linhas_da_memoria.append("01110000000000000101010100000000")
	micro_da_linha.append("24: goto 0;")
		#"name": "goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 25: alu:=tir; if n then goto 27;
	linhas_da_memoria.append("00110000000000000101010000011011")
	micro_da_linha.append("25: alu:=tir; if n then goto 27;")
		#"name": "alu := tir; if n then goto 27",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00011011"
	

	# 26: pc:=band(ir,amask); goto 0;
	linhas_da_memoria.append("01101000000100001000001100000000")
	micro_da_linha.append("26: pc:=band(ir,amask); goto 0;")
		#"name": "pc := band(ir,amask); goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "01", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0000", "B": "1000", "A": "0011",
		#"ADDR": "00000000"
	

	# 27: ac:=band(ir,amask); goto 0;
	linhas_da_memoria.append("01101000000100011000001100000000")
	micro_da_linha.append("27: ac:=band(ir,amask); goto 0;")
		#"name": "ac := band(ir,amask); goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "01", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0001", "B": "1000", "A": "0011",
		#"ADDR": "00000000"
	

	# 28: tir:=lshift(ir + ir); if n then goto 40;
	linhas_da_memoria.append("00100100000101000011001100101000")
	micro_da_linha.append("28: tir:=lshift(ir + ir); if n then goto 40;")
		#"name": "tir := lshift(ir + ir); if n then goto 40",
		#"AMUX": "0", "COND": "01", "ULA": "00", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0011", "A": "0011",
		#"ADDR": "00101000"

	# 29: tir:=lshift(tir); if n then goto 35;
	linhas_da_memoria.append("00110100000101000101010000100011")
	micro_da_linha.append("29: tir:=lshift(tir); if n then goto 35;")
		#"name": "tir := lshift(tir); if n then goto 35",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "00100011"
	

	# 30: alu:=tir; if n then goto 33;
	linhas_da_memoria.append("00110000000000000101010000100001")
	micro_da_linha.append("30: alu:=tir; if n then goto 33;")
		#"name": "alu := tir; if n then goto 33",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00100001"
	

	# 31: a:=ir + sp;
	linhas_da_memoria.append("00000000000110100010001100000000")
	micro_da_linha.append("31: a:=ir + sp;")
		#"name": "a := ir + sp",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0010", "A": "0011",
		#"ADDR": "00000000"
	

	# 32: mar:=a; rd; goto 7;
	linhas_da_memoria.append("01110000110000001010010100000111")
	micro_da_linha.append("32: mar:=a; rd; goto 7;")
		#"name": "mar := a; rd; goto 7",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "1010", "A": "0101",
		#"ADDR": "00000111"
	

	# 33: a:=ir + sp;
	linhas_da_memoria.append("00000000000110100010001100000000")
	micro_da_linha.append("33: a:=ir + sp;")
		#"name": "a := ir + sp",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0010", "A": "0011",
		#"ADDR": "00000000"
	

	# 34: mar:=a; mbr:=ac; wr; goto 10;
	linhas_da_memoria.append("01110001101000001010000100001010")
	micro_da_linha.append("34: mar:=a; mbr:=ac; wr; goto 10;")
		#"name": "mar := a; mbr := ac; wr; goto 10",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "1", "MAR": "1", "RD": "0", "WR": "1", "ENC": "0",
		#"C": "0000", "B": "1010", "A": "0001",
		#"ADDR": "00001010"
	

	# 35: alu:=tir; if n then goto 38;
	linhas_da_memoria.append("00110000000000000101010000100110")
	micro_da_linha.append("35: alu:=tir; if n then goto 38;")
		#"name": "alu := tir; if n then goto 38",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00100110"
	

	# 36: a:=ir + sp;
	linhas_da_memoria.append("00000000000110100010001100000000")
	micro_da_linha.append("36: a:=ir + sp;")
		#"name": "a := ir + sp",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0010", "A": "0011",
		#"ADDR": "00000000"
	
	# 37: mar:=a; rd; goto 13;
	linhas_da_memoria.append("01110000110000001010010100001101")
	micro_da_linha.append("37: mar:=a; rd; goto 13;")
		#"name": "mar := a; rd; goto 13",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "1010", "A": "0101",
		#"ADDR": "00001101"
	

	# 38: a:=ir + sp;
	linhas_da_memoria.append("00000000000110100010001100000000")
	micro_da_linha.append("38: a:=ir + sp;")
		#"name": "a := ir + sp",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0010", "A": "0011",
		#"ADDR": "00000000"
	

	# 39: mar:=a; rd; goto 16;
	linhas_da_memoria.append("01110000110000001010010100010000")
	micro_da_linha.append("39: mar:=a; rd; goto 16;")
		#"name": "mar := a; rd; goto 16",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "1010", "A": "0101",
		#"ADDR": "00010000"
	

	# 40: tir:=lshift(tir); if n then goto 46;
	linhas_da_memoria.append("00110100000101000101010000101110")
	micro_da_linha.append("40: tir:=lshift(tir); if n then goto 46;")
		#"name": "tir := lshift(tir); if n then goto 46",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "00101110"
	

	# 41: alu:=tir; if n then goto 44;
	linhas_da_memoria.append("00110000000000000101010000101100")
	micro_da_linha.append("41: alu:=tir; if n then goto 44;")
		#"name": "alu := tir; if n then goto 44",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00101100"
	

	# 42: alu:=ac; if n then goto 22;
	linhas_da_memoria.append("00110000000000000101000100010110")
	micro_da_linha.append("42: alu:=ac; if n then goto 22;")
		#"name": "alu := ac; if n then goto 22",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0001",
		#"ADDR": "00010110"
	

	# 43: goto 0;
	linhas_da_memoria.append("01110000000000000101010100000000")
	micro_da_linha.append("43: goto 0;")
		#"name": "goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"

	# 44: alu:=ac; if z then goto 0;
	linhas_da_memoria.append("01010000000000000101000100000000")
	micro_da_linha.append("44: alu:=ac; if z then goto 0;")
		#"name": "alu := ac; if z then goto 0",
		#"AMUX": "0", "COND": "10", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0001",
		#"ADDR": "00000000"
	

	# 45: pc:=band(ir,amask); goto 0;
	linhas_da_memoria.append("01101000000100001000001100000000")
	micro_da_linha.append("45: pc:=band(ir,amask); goto 0;")
		#"name": "pc := band(ir,amask); goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "01", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0000", "B": "1000", "A": "0011",
		#"ADDR": "00000000"
	

	# 46: tir:=lshift(tir); if n then goto 50;
	linhas_da_memoria.append("00110100000101000101010000110010")
	micro_da_linha.append("46: tir:=lshift(tir); if n then goto 50;")
		#"name": "tir := lshift(tir); if n then goto 50",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "00110010"
	

	# 47: sp:=sp + (-1);
	linhas_da_memoria.append("00000000000100100111001000000000")
	micro_da_linha.append("47: sp:=sp + (-1);")
		#"name": "sp := sp + (-1)",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "0111", "A": "0010",
		#"ADDR": "00000000"
	#

	# 48: mar:=sp; mbr:=pc; wr;
	linhas_da_memoria.append("00010001101000000010000000000000")
	micro_da_linha.append("48: mar:=sp; mbr:=pc; wr;")
		#"name": "mar := sp; mbr := pc; wr",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "1", "MAR": "1", "RD": "0", "WR": "1", "ENC": "0",
		#"C": "0000", "B": "0010", "A": "0000",
		#"ADDR": "00000000"
	

	# 49: pc:=band(ir,amask); wr; goto 0;
	linhas_da_memoria.append("01101000001100001000001100000000")
	micro_da_linha.append("49: pc:=band(ir,amask); wr; goto 0;")
		#"name": "pc := band(ir,amask); wr; goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "01", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "1", "ENC": "1",
		#"C": "0000", "B": "1000", "A": "0011",
		#"ADDR": "00000000"
	

	# 50: tir:=lshift(tir); if n then goto 65;
	linhas_da_memoria.append("00110100000101000101010001000001")
	micro_da_linha.append("50: tir:=lshift(tir); if n then goto 65;")
		#"name": "tir := lshift(tir); if n then goto 65",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "01000001"
	

	# 51: tir:=lshift(tir); if n then goto 59;
	linhas_da_memoria.append("00110100000101000101010000111011")
	micro_da_linha.append("51: tir:=lshift(tir); if n then goto 59;")

		#"name": "tir := lshift(tir); if n then goto 59",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "00111011"
	

	# 52: alu:=tir; if n then goto 56;
	linhas_da_memoria.append("00110000000000000101010000111000")
	micro_da_linha.append("52: alu:=tir; if n then goto 56;")
		#"name": "alu := tir; if n then goto 56",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00111000"
	

	# 53: mar:=ac; rd;
	linhas_da_memoria.append("00010000110000000001010100000000")
	micro_da_linha.append("53: mar:=ac; rd;")
		#"name": "mar := ac; rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0001", "A": "0101",
		#"ADDR": "00000000"
	

	# 54: sp:=sp + (-1); rd;
	linhas_da_memoria.append("00000000010100100111001000000000")
	micro_da_linha.append("54: sp:=sp + (-1); rd;")
		#"name": "sp := sp + (-1); rd",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "0111", "A": "0010",
		#"ADDR": "00000000"
	

	# 55: mar:=sp; wr; goto 10;
	linhas_da_memoria.append("01110000101000000010010100001010")
	micro_da_linha.append("55: mar:=sp; wr; goto 10;")
		#"name": "mar := sp; wr; goto 10",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "0", "WR": "1", "ENC": "0",
		#"C": "0000", "B": "0010", "A": "0101",
		#"ADDR": "00001010"
	

	# 56: mar:=sp; sp:=sp + 1; rd;
	linhas_da_memoria.append("00000000110100100010011000000000")
	micro_da_linha.append("56: mar:=sp; sp:=sp + 1; rd;")
		#"name": "mar := sp; sp := sp + 1; rd",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "0010", "A": "0110",
		#"ADDR": "00000000"
	

	# 57: rd;
	linhas_da_memoria.append("00010000010000000101010100000000")
	micro_da_linha.append("57: rd;")
		#"name": "rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	
	
	# 58: mar:=ac; wr; goto 10;
	linhas_da_memoria.append("01110000101000000001010100001010")
	micro_da_linha.append("58: mar:=ac; wr; goto 10;")
		#"name": "mar := ac; wr; goto 10",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "0", "WR": "1", "ENC": "0",
		#"C": "0000", "B": "0001", "A": "0101",
		#"ADDR": "00001010"
	

	# 59: alu:=tir; if n then goto 62;
	linhas_da_memoria.append("00110000000000000101010000111110")
	micro_da_linha.append("59: alu:=tir; if n then goto 62;")
		#"name": "alu := tir; if n then goto 62",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "00111110"
	

	# 60: sp:=sp + (-1);
	linhas_da_memoria.append("00000000010100100111001000000000")
	micro_da_linha.append("60: sp:=sp + (-1);")
		#"name": "sp := sp + (-1); rd",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "0111", "A": "0010",
		#"ADDR": "00000000"
	

	# 61: mar:=sp; mbr:=ac; wr; goto 10;
	linhas_da_memoria.append("01110001101000000010000100001010")
	micro_da_linha.append("61: mar:=sp; mbr:=ac; wr; goto 10;")
		#"name": "mar := sp; mbr := ac; wr; goto 10",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "1", "MAR": "1", "RD": "0", "WR": "1", "ENC": "0",
		#"C": "0000", "B": "0010", "A": "0001",
		#"ADDR": "00001010"
	

	# 62: mar:=sp; sp:=sp + 1; rd;
	linhas_da_memoria.append("00000000110100100010011000000000")
	micro_da_linha.append("62: mar:=sp; sp:=sp + 1; rd;")
		#"name": "mar := sp; sp := sp + 1; rd",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "0010", "A": "0110",
		#"ADDR": "00000000"
	

	# 63: rd;
	linhas_da_memoria.append("00010000010000000101010100000000")
	micro_da_linha.append("63: rd;")
		#"name": "rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"

	# 64: ac:=mbr; goto 0;
	linhas_da_memoria.append("11110000000100010101010100000000")
	micro_da_linha.append("64: ac:=mbr; goto 0;")
		#"name": "ac := mbr; goto 0",
		#"AMUX": "1", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0001", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	

	# 65: tir:=lshift(tir); if n then goto 73;
	linhas_da_memoria.append("00110100000101000101010001001001")
	micro_da_linha.append("65: tir:=lshift(tir); if n then goto 73;")
		#"name": "tir := lshift(tir); if n then goto 73",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "10",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0100", "B": "0101", "A": "0100",
		#"ADDR": "01001001"
	

	# 66: alu:=tir; if n then goto 70;
	linhas_da_memoria.append("00110000000000000101010001000110")
	micro_da_linha.append("66: alu:=tir; if n then goto 70;")
		#"name": "alu := tir; if n then goto 70",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "01000110"
	

	# 67: mar:=sp; sp:=sp + 1; rd;
	linhas_da_memoria.append("00000000110100100010011000000000")
	micro_da_linha.append("67: mar:=sp; sp:=sp + 1; rd;")
		#"name": "mar := sp; sp := sp + 1; rd",
		#"AMUX": "0", "COND": "00", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "1", "RD": "1", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "0010", "A": "0110",
		#"ADDR": "00000000"
	

	# 68: rd;
	linhas_da_memoria.append("00010000010000000101010100000000")
	micro_da_linha.append("68: rd;")
		#"name": "rd",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "1", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"

	# 69: pc:=mbr; goto 0;
	linhas_da_memoria.append("11110000000100000101010100000000")
	micro_da_linha.append("69: pc:=mbr; goto 0;")
		#"name": "pc := mbr; goto 0",
		#"AMUX": "1", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0000", "B": "0101", "A": "0101",
		#"ADDR": "00000000"
	
	
	# 70: a:=ac;
	linhas_da_memoria.append("00010000000110100101000100000000")
	micro_da_linha.append("70: a:=ac;")
		#"name": "a := ac",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0101", "A": "0001",
		#"ADDR": "00000000"
	

	# 71: ac:=sp;
	linhas_da_memoria.append("00010000000100010101001000000000")
	micro_da_linha.append("70: a:=ac;")
		#"name": "ac := sp",
		#"AMUX": "0", "COND": "00", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0001", "B": "0101", "A": "0010",
		#"ADDR": "00000000"
	

	# 72: sp:=a; goto 0;
	linhas_da_memoria.append("01110000000100100101101000000000")
	micro_da_linha.append("72: sp:=a; goto 0;")
		#"name": "sp := a; goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "0101", "A": "1010",
		#"ADDR": "00000000"
	

	# 73: alu:=tir; if n then goto 76;
	linhas_da_memoria.append("00110000000000000101010001001100")
	micro_da_linha.append("73: alu:=tir; if n then goto 76;")
		#"name": "alu := tir; if n then goto 76",
		#"AMUX": "0", "COND": "01", "ULA": "10", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "0",
		#"C": "0000", "B": "0101", "A": "0100",
		#"ADDR": "01001100"
	

	# 74: a:=band(ir,smask);
	linhas_da_memoria.append("00001000000110101001001100000000")
	micro_da_linha.append("74: a:=band(ir,smask);")
		#"name": "a := band(ir,smask)",
		#"AMUX": "0", "COND": "00", "ULA": "01", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "1001", "A": "0011",
		#"ADDR": "00000000"
	

	# 75: sp:=sp + a; goto 0;
	linhas_da_memoria.append("01100000000100101010001000000000")
	micro_da_linha.append("75: sp:=sp + a; goto 0;")
		#"name": "sp := sp + a; goto 0",
		#"AMUX": "0", "COND": "11", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "0010", "B": "1010", "A": "0010",
		#"ADDR": "00000000"
	

	# 76: a:=band(ir,smask);
	linhas_da_memoria.append("00001000000110101001001100000000")
	micro_da_linha.append("76: a:=band(ir,smask);")
		#"name": "a := band(ir,smask)",
		#"AMUX": "0", "COND": "00", "ULA": "01", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "1001", "A": "0011",
		#"ADDR": "00000000"
	

	# 77: a:=inv(a);
	linhas_da_memoria.append("00011000000110100101101000000000")
	micro_da_linha.append("77: a:=inv(a);")
		#"name": "a := inv(a)",
		#"AMUX": "0", "COND": "00", "ULA": "11", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0101", "A": "1010",
		#"ADDR": "00000000"
	

	# 78: a:=a + 1; goto 75;
	linhas_da_memoria.append("01100000000110100110101001001011")
	micro_da_linha.append("78: a:=a + 1; goto 75;")
		#"name": "a := a + 1; goto 75",
		#"AMUX": "0", "COND": "11", "ULA": "00", "DESL": "00",
		#"MBR": "0", "MAR": "0", "RD": "0", "WR": "0", "ENC": "1",
		#"C": "1010", "B": "0110", "A": "1010",
		#"ADDR": "01001011"
	
	
