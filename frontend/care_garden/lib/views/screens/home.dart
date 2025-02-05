import 'package:care_garden/views/widgets/agendamento/lista_agendamento.dart';
import 'package:care_garden/views/widgets/calendario.dart';
import 'package:care_garden/views/widgets/planta/lista_plantas.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _mostrarListaPlantas = false;

  void mostrarListaPlantas() {
    setState(() {
      _mostrarListaPlantas = !_mostrarListaPlantas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: mostrarListaPlantas,
            icon: Icon(
              !_mostrarListaPlantas ? Icons.list : Icons.calendar_month,
            ),
          )
        ],
        title: Text('CareGarden'),
      ),
      body: !_mostrarListaPlantas
          ? Column(
              children: [
                Calendario(),
                ListaAgendamento(),
              ],
            )
          : ListaPlantas(),
    );
  }
}
