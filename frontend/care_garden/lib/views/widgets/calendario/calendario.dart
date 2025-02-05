import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(DateTime.now().year, 01, 01),
      lastDay: DateTime.utc(DateTime.now().year, 12, 31),
    );
  }
}
