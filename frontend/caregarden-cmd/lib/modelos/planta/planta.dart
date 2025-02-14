import 'package:caregarden_cmd/utilitarios/grupo_planta.dart';

abstract class Planta {
  final int? id;
  final String nome;
  final DateTime dataDeAquisicao;
  final GrupoPlanta grupo;
  final List<int>? agendamentos;

  Planta({
    this.id,
    required this.nome,
    required this.dataDeAquisicao,
    required this.grupo,
    this.agendamentos = const [],
  });

  String caracteristicas();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'dataDeAquisicao': dataDeAquisicao.toIso8601String(),
      'grupo': grupo.name,
      'agendamentos': agendamentos ?? [],
    };
  }
}
