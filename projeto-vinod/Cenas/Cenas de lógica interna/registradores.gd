extends ComponenteBase

@export var decoder_a : ComponenteBase;
@export var decoder_b : ComponenteBase;
@export var decoder_c : ComponenteBase;

@export var barramento_a : Barramento;
@export var barramento_b : Barramento;
@export var deslocador : ComponenteBase;

func agir():
	for i in range(0, decoder_a.saida.length()):
		if decoder_a.saida[i] == "1":
			barramento_a.origem = get_child(i);
			break;
	
	for i in range(0, decoder_b.saida.length()):
		if decoder_b.saida[i] == "1":
			barramento_b.origem = get_child(i);
			break;

## Função clockada
func atualiza_em_c():
	for i in range(0, decoder_c.saida.length()):
		if decoder_c.saida[i] == "1":
			if controle == "1":
				get_child(i).saida = deslocador.saida;
			break;
