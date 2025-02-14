import 'package:caregarden_cmd/utilitarios/enums/evento.dart';

abstract class Agendamento {
  final int? id;
  final int planta;
  final DateTime data;
  final Evento evento;

  Agendamento({
    required this.id,
    required this.planta,
    required this.data,
    required this.evento,
  });

  Agendamento.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        planta = json['planta'],
        data = DateTime.parse(
          json['data'],
        ),
        evento = Evento.values.byName(
          json['evento'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'planta': planta,
      'data': data.toIso8601String(),
      'evento': evento.nome
    };
  }
}
