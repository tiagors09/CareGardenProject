import 'package:care_garden/models/agendamento.dart';
import 'package:care_garden/views/widgets/agendamento/agendamento_lista_item.dart';
import 'package:flutter/material.dart';

class ListaAgendamento extends StatefulWidget {
  final List<Agendamento> agendamentos;

  const ListaAgendamento({
    super.key,
    required this.agendamentos,
  });

  @override
  State<ListaAgendamento> createState() => _ListaAgendamentoState();
}

class _ListaAgendamentoState extends State<ListaAgendamento> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (ctx, i) {
        return AgendamentoListaItem(
          nomePlanta: '',
          dataEvento: DateTime.now(),
        );
      },
    );
  }
}
