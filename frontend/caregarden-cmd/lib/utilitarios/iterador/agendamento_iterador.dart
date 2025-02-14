// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:caregarden_cmd/modelos/agendamento/agendamento.dart';
import 'package:caregarden_cmd/utilitarios/iterador/iterador.dart';

class AgendamentoIterador extends Iterador<AgendamentoIterador, Agendamento> {
  final List<Agendamento> agendamentos;
  final int indiceAtual;

  AgendamentoIterador({
    required this.agendamentos,
    required this.indiceAtual,
  });

  @override
  Agendamento atual() {
    // TODO: implement atual
    throw UnimplementedError();
  }

  @override
  AgendamentoIterador proximo() {
    // TODO: implement proximo
    throw UnimplementedError();
  }

  @override
  bool temProximo() {
    // TODO: implement temProximo
    throw UnimplementedError();
  }
}
