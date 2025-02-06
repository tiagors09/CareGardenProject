import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgendamentoListaItem extends StatelessWidget {
  final String nomePlanta;
  final DateTime dataEvento;

  const AgendamentoListaItem({
    super.key,
    required this.nomePlanta,
    required this.dataEvento,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nomePlanta),
        subtitle: Text(
          DateFormat('dd MMM yyyy').format(dataEvento),
        ),
      ),
    );
  }
}
