import 'package:flutter/material.dart';

class ListaAgendamento extends StatefulWidget {
  const ListaAgendamento({super.key});

  @override
  State<ListaAgendamento> createState() => _ListaAgendamentoState();
}

class _ListaAgendamentoState extends State<ListaAgendamento> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Lista Agendamento'),
    );
  }
}
