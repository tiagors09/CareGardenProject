import 'package:caregarden_cmd/models/agendamento/agendamento.dart';
import 'package:caregarden_cmd/models/planta/planta.dart';
import 'package:caregarden_cmd/utils/grupo_planta.dart';

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
      agendamentos: json['agendamentos'] != null
          ? (json['agendamentos'] as List)
              .map((e) => Agendamento.fromJson(e))
              .toList()
          : null,
    );
  }
}
