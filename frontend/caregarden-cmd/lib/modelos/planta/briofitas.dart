import 'package:caregarden_cmd/modelos/agendamento/agendamento.dart';
import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/grupo_planta.dart';

class Briofitas extends Planta {
  Briofitas({
    super.id,
    required super.nome,
    required super.dataDeAquisicao,
    super.grupo = GrupoPlanta.briofita,
    super.agendamentos,
  });

  @override
  String caracteristicas() {
    return "$nome é uma ${grupo.nome} faz fotossíntese sem vasos condutores.";
  }

  factory Briofitas.fromJson(Map<String, dynamic> json) {
    return Briofitas(
      id: json['id'],
      nome: json['nome'],
      dataDeAquisicao: DateTime.parse(json['dataDeAquisicao']),
      grupo: GrupoPlanta.values.byName(json['grupo']),
      agendamentos: json['agenfamentos'] ?? [],
    );
  }
}
