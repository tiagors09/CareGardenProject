import 'package:care_garden/models/agendamento.dart';
import 'package:care_garden/views/widgets/agendamento/agendamento_lista_item.dart';
import 'package:flutter/material.dart';

class ListaAgendamento extends StatelessWidget {
  final List<Agendamento> agendamentos;

  const ListaAgendamento({
    super.key,
    required this.agendamentos,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: agendamentos.length,
        itemBuilder: (ctx, i) {
          return AgendamentoListaItem(
            nomePlanta: agendamentos[i].plantaNome,
            dataEvento: agendamentos[i].data,
          );
        },
      ),
    );
  }
}
