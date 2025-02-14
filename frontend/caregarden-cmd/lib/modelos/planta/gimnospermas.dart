import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/grupo_planta.dart';

class Gimnospermas extends Planta {
  Gimnospermas({
    super.id,
    required super.nome,
    required super.dataDeAquisicao,
    super.grupo = GrupoPlanta.gimnosperma,
    super.agendamentos,
  });

  @override
  String caracteristicas() {
    return "$nome é uma ${grupo.nome} faz fotossíntese e produz sementes nuas.";
  }

  factory Gimnospermas.fromJson(Map<String, dynamic> json) {
    return Gimnospermas(
      id: json['id'],
      nome: json['nome'],
      dataDeAquisicao: DateTime.parse(json['dataDeAquisicao']),
      grupo: GrupoPlanta.values.byName(json['grupo']),
      agendamentos: json['agenfamentos'] ?? [],
    );
  }
}
