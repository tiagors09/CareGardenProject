import 'package:care_garden/utils/rotas.dart';
import 'package:flutter/material.dart';

class CalendarioControlador {
  void agendar(DateTime selectedDay, DateTime focusedDay, BuildContext ctx) {
    Navigator.pushNamed(ctx, Rotas.agendamentoFormulario);
  }
}
