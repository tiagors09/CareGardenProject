import 'package:care_garden/controllers/calendario_controlador.dart';
import 'package:care_garden/controllers/lista_plantas_controlador.dart';
import 'package:care_garden/models/agendamento.dart';
import 'package:care_garden/models/planta.dart';
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

  List<Agendamento> mockAgendamentos = [
    Agendamento(
      id: 1,
      plantaId: 101,
      plantaNome: "Rosa",
      data: DateTime.parse("2024-02-15T10:00:00"),
    ),
    Agendamento(
      id: 2,
      plantaId: 102,
      plantaNome: "Orquídea",
      data: DateTime.parse("2024-02-16T14:30:00"),
    ),
    Agendamento(
      id: 3,
      plantaId: 103,
      plantaNome: "Girassol",
      data: DateTime.parse("2024-02-17T09:00:00"),
    ),
    Agendamento(
      id: 4,
      plantaId: 104,
      plantaNome: "Samambaia",
      data: DateTime.parse("2024-02-18T16:45:00"),
    ),
    Agendamento(
      id: 5,
      plantaId: 105,
      plantaNome: "Cacto",
      data: DateTime.parse("2024-02-19T08:15:00"),
    ),
  ];

  List<Planta> mockPlantas = [
    Planta(
      id: 1,
      nome: "Suculenta",
      dataDeAquisicao: DateTime(2023, 5, 10),
    ),
    Planta(
      id: 2,
      nome: "Orquídea",
      dataDeAquisicao: DateTime(2022, 8, 15),
    ),
    Planta(
      id: 3,
      nome: "Espada de São Jorge",
      dataDeAquisicao: DateTime(2021, 11, 3),
    ),
    Planta(
      id: 4,
      nome: "Bonsai",
      dataDeAquisicao: DateTime(2020, 3, 27),
    ),
    Planta(
      id: 5,
      nome: "Avenca",
      dataDeAquisicao: DateTime(2023, 1, 12),
    ),
  ];

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
                ListaAgendamento(
                  agendamentos: mockAgendamentos,
                ),
              ],
            )
          : ListaPlantas(
              plantas: mockPlantas,
              controlador: ListaPlantasControlador(),
            ),
    );
  }
}
