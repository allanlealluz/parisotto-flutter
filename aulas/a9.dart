//Estrutura de dados
void main() {
  //Tuplas
  var pessoa = ( 'Tamires', 20, 1.65, 'Feminino', true );
  print(pessoa);
  print(pessoa.runtimeType);
  print(pessoa.$1);
  print(pessoa.$2);
  print(pessoa.hashCode);

  //Tuplas com tipagem
  (String, int, double, String, bool) dados = ('Nome', 30, 1.75, 'Masculino', false);
  print(dados);
  //
  var (nome, ano , professor) = ('Tamires', 20, true);
  var (nome) = 'Tamires3';

  //List
  List aluno = [  ];
  List estudantes = ['Tamires', 'João', 1, 'Pedro', 7];
  print(estudantes.runtimeType);

  print(estudantes[2].runtimeType);
  
  List teste = [['1',2 , '3'], [4,5]];
  print(teste.runtimeType);
  print(teste[0][0].runtimeType);

  //Map
  Map teste {}; 

  Map paises = {
    'Brasil': 'Brasília',
    'Argentina': 'Buenos Aires',
    'Uruguai': 'Montevidéu',
  };
  const paises2 = {
    'Br': 'Brasil - Brasília',
    'Ar': 'Argentina - Buenos Aires',
    'Ur': 'Uruguai - Montevidéu',
  };

  paises['EUA'] = 'Washington D.C.';
  print(paises);

  paises.ForEach((key, value) {
    print('País: $key - Capital: $value');
  });

  //Set
  Set teste2 = {};
  Set Times = {'Palmeiras', 'Flamengo', 'Cruzeiro', 'São Paulo', 'Palmeiras'};
  print(Times);
}