import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';

abstract class Planta {
  final int? id;
  final String nome;
  final GrupoPlanta grupo;

  Planta({
    this.id,
    required this.nome,
    required this.grupo,
  });

  String caracteristicas();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'grupo': grupo.name,
    };
  }
}
