void main(){
  //Tupla
  var pessoa = ('tamires',24,1.05,true);
  print(pessoa.runtimeType);
  print(pessoa.$2);
  (String, int, bool) dados = ("Allan", 20, true);
  print(dados);

  var (nome,ano,professor) = ("Allan", 20, "Parisotto");
  print("$nome $professor $ano");

  // Lista
  List estudantes = [];
  List Alunos = ["Sofia", "Tamires", "Tales"];
  print("$estudantes $Alunos");
  print(Alunos[0]);
  dynamic studants = new List.empty();
  print(studants is List);
  print(Alunos.elementAt(2));
  print(Alunos[Alunos.length-1]);

  // map
  Map paises = {
    "BR" : "BRASIL" ,
    "FR" : "FRANÇA"
  };
  var estados = {
  };
  Map estados2 = new Map();
  print(paises["BR"]);
  print(paises);
  paises["US"] = "USA";
  print(paises);
  Set times = {"Palmeiras", "Corinthias","São Paulo"};
  var basquete = new Set();
}