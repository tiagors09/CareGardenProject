import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'caminhoFoto': caminhoFoto,
      'nome': nome,
      'dataDeAquisicao': dataDeAquisicao.millisecondsSinceEpoch,
    };
  }

  factory Planta.fromMap(Map<String, dynamic> map) {
    return Planta(
      id: map['id'] != null ? map['id'] as int : null,
      caminhoFoto: map['caminhoFoto'] as String,
      nome: map['nome'] as String,
      dataDeAquisicao:
          DateTime.fromMillisecondsSinceEpoch(map['dataDeAquisicao'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Planta.fromJson(String source) =>
      Planta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Planta(id: $id, caminhoFoto: $caminhoFoto, nome: $nome, dataDeAquisicao: $dataDeAquisicao)';
  }
}
