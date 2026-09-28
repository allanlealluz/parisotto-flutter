void main() {
  int dia = 9;
  bool feriado = false;
  String hoje;

  switch (dia) {
    case 1:
      hoje = "Domingo";
      break;
    case 2:
      hoje = "Segunda";
      break;
    case 3:
      hoje = "Terça";
      break;
    case 4:
      hoje = "Quarta";
      break;
    case 5:
      hoje = "Quinta";
      break;
    case 6:
      hoje = "Sexta";
      break;
    case 7 || 8 || 9 || 10:
      hoje = "Sábado";
      break;
    default:
      hoje = "Dia inválido";
  }

String today = switch(dia){
  1 => "Domingo",
  2 => "Segunda feira",
  4 when feriado == false => "Quarta feira",
  8 || 9 || 10 => "Não sei",
  _ => "Dia Inválido"
};
}