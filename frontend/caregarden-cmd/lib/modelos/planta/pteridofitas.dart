import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';

class Pteridofitas extends Planta {
  Pteridofitas({
    super.id,
    required super.nome,
    super.grupo = GrupoPlanta.pteridofita,
  });

  @override
  String caracteristicas() {
    return '$id | $nome é uma ${grupo.nome} faz fotossíntese e se reproduz por esporos.';
  }

  factory Pteridofitas.fromJson(Map<String, dynamic> json) {
    return Pteridofitas(
      id: json['id'],
      nome: json['nome'],
      grupo: GrupoPlanta.values.byName(json['grupo']),
    );
  }
}
