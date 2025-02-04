class Planta {
  final int? id;
  final String caminhoFoto;
  final String nome;
  final DateTime dataDeAquisicao;

  Planta({
    required this.id,
    required this.caminhoFoto,
    required this.nome,
    required this.dataDeAquisicao,
  });

  Planta.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        caminhoFoto = json['caminhoFoto'],
        nome = json['nome'],
        dataDeAquisicao = DateTime.parse(json['dataDeAquisicao']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'caminhoFoto': caminhoFoto,
      'nome': nome,
      'dataDeAquisicao': dataDeAquisicao.toIso8601String(),
    };
  }
}
