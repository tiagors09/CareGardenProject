import 'package:care_garden/controllers/calendario_controlador.dart';
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

  List<Planta> mockPlantas = [
    Planta(
      id: 1,
      caminhoFoto: "https://example.com/images/suculenta.jpg",
      nome: "Suculenta",
      dataDeAquisicao: DateTime(2023, 5, 10),
    ),
    Planta(
      id: 2,
      caminhoFoto: "https://example.com/images/orquidea.jpg",
      nome: "Orquídea",
      dataDeAquisicao: DateTime(2022, 8, 15),
    ),
    Planta(
      id: 3,
      caminhoFoto: "https://example.com/images/espada_de_sao_jorge.jpg",
      nome: "Espada de São Jorge",
      dataDeAquisicao: DateTime(2021, 11, 3),
    ),
    Planta(
      id: 4,
      caminhoFoto: "https://example.com/images/bonsai.jpg",
      nome: "Bonsai",
      dataDeAquisicao: DateTime(2020, 3, 27),
    ),
    Planta(
      id: 5,
      caminhoFoto: "https://example.com/images/avenca.jpg",
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
                  agendamentos: [],
                ),
              ],
            )
          : ListaPlantas(
              plantas: mockPlantas,
            ),
    );
  }
}
