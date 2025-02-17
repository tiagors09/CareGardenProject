import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';

class Gimnospermas extends Planta {
  Gimnospermas({
    super.id,
    required super.nome,
    super.grupo = GrupoPlanta.gimnosperma,
  });

  @override
  String caracteristicas() {
    return '$id | $nome é uma ${grupo.nome} faz fotossíntese e produz sementes nuas.';
  }

  factory Gimnospermas.fromJson(Map<String, dynamic> json) {
    return Gimnospermas(
      id: json['id'],
      nome: json['nome'],
      grupo: GrupoPlanta.values.byName(json['grupo']),
    );
  }
}
