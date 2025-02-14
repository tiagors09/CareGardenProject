import 'package:care_garden/utils/tipo_planta.dart';

class Planta {
  final int? id;
  final String nome;
  final DateTime dataDeAquisicao;
  final TipoPlanta? tipoPlanta;

  Planta({
    this.id,
    required this.nome,
    required this.dataDeAquisicao,
    this.tipoPlanta,
  });

  Planta.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        dataDeAquisicao = DateTime.parse(json['dataDeAquisicao']),
        tipoPlanta = TipoPlanta.values.firstWhere(
          (valor) => valor == json['tipoPlanta'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'dataDeAquisicao': dataDeAquisicao.toIso8601String(),
      'tipoPlanta': tipoPlanta!.tipo
    };
  }
}
