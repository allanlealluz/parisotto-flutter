void main() {
  int dia = 5;
  bool feriado = false;
  String hoje;

  switch(dia) {
    case 1: hoje = 'domingo';
      break;
    case 2: hoje = 'segunda';
      break;
    case 3: hoje = 'terça';
      break;
    case 4: hoje = 'quarta';
      break;
    case 5: hoje = 'quinta';
      break;
    case 6: hoje = 'sexta';
      break;
    case 7: hoje = 'sabado';
      break;
    default: hoje = 'há algo de errado Senhor';
      break;
  }

  print(hoje);
}