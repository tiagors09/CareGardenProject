import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/grupo_planta.dart';

class Pteridofitas extends Planta {
  Pteridofitas({
    super.id,
    required super.nome,
    required super.dataDeAquisicao,
    super.grupo = GrupoPlanta.pteridofita,
    super.agendamentos,
  });

  @override
  String caracteristicas() {
    return "$nome é uma ${grupo.nome} faz fotossíntese e se reproduz por esporos.";
  }

  factory Pteridofitas.fromJson(Map<String, dynamic> json) {
    return Pteridofitas(
      id: json['id'],
      nome: json['nome'],
      dataDeAquisicao: DateTime.parse(json['dataDeAquisicao']),
      grupo: GrupoPlanta.values.byName(json['grupo']),
      agendamentos: json['agenfamentos'] ?? [],
    );
  }
}
