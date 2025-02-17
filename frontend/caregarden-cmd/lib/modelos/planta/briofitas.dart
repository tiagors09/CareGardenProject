import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';

class Briofitas extends Planta {
  Briofitas({
    super.id,
    required super.nome,
    super.grupo = GrupoPlanta.briofita,
  });

  @override
  String caracteristicas() {
    return '$id | $nome é uma ${grupo.nome} faz fotossíntese sem vasos condutores.';
  }

  factory Briofitas.fromJson(Map<String, dynamic> json) {
    return Briofitas(
      id: json['id'],
      nome: json['nome'],
      grupo: GrupoPlanta.values.byName(json['grupo']),
    );
  }
}
