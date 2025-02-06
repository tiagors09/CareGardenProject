import 'package:care_garden/controllers/calendario_controlador.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatelessWidget {
  final CalendarioControlador controlador;

  const Calendario({
    super.key,
    required this.controlador,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(DateTime.now().year, 01, 01),
      lastDay: DateTime.utc(DateTime.now().year, 12, 31),
      onDayLongPressed: (DateTime selectedDay, DateTime focusedDay) =>
          controlador.agendar(
        selectedDay,
        focusedDay,
        context,
      ),
    );
  }
}
