import 'package:caregarden_cmd/modelos/agendamento/agendamento.dart';
import 'package:caregarden_cmd/utilitarios/agregador/agregador.dart';
import 'package:caregarden_cmd/utilitarios/enums/evento.dart';
import 'package:caregarden_cmd/utilitarios/iterador/agendamento_iterador.dart';

class Agendamentos extends Agregador<AgendamentoIterador> {
  @override
  AgendamentoIterador geraIterador() {
    // TODO: implement geraIterador
    throw UnimplementedError();
  }

  void adicionar(
    int? id,
    int planta,
    DateTime data,
    Evento evento,
  ) {
    // TODO: implement adicionar
    throw UnimplementedError();
  }
}
