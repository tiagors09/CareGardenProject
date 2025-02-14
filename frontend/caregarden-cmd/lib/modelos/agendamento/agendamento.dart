import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/fabrica_de_planta.dart';

class Agendamento {
  final int? id;
  final Planta planta;
  final DateTime data;

  Agendamento({
    required this.id,
    required this.planta,
    required this.data,
  });

  Agendamento.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        planta = FabricaDePlanta.fabricarPlanta(
          json['nome'],
          DateTime.parse(
            json['dataDeAquisicao'],
          ),
          json['grupo'],
        ),
        data = DateTime.parse(
          json['data'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'planta': planta.toJson(), // Corrigido
      'data': data.toIso8601String(),
    };
  }
}
