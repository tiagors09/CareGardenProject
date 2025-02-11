class Planta {
  final int? id;
  final String nome;
  final DateTime dataDeAquisicao;

  Planta({
    required this.id,
    required this.nome,
    required this.dataDeAquisicao,
  });

  Planta.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        dataDeAquisicao = DateTime.parse(json['dataDeAquisicao']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'dataDeAquisicao': dataDeAquisicao.toIso8601String(),
    };
  }
}
