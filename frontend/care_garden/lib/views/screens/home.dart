import 'package:care_garden/controllers/calendario_controlador.dart';
import 'package:care_garden/utils/rotas.dart';
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

  void abrirFormularioPlantas() {
    Navigator.pushNamed(context, Rotas.plantaFormulario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _mostrarListaPlantas,
        child: FloatingActionButton(
          onPressed: abrirFormularioPlantas,
          child: Icon(Icons.add),
        ),
      ),
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
                Calendario(
                  controlador: CalendarioControlador(),
                ),
                ListaAgendamento(),
              ],
            )
          : ListaPlantas(),
    );
  }
}
