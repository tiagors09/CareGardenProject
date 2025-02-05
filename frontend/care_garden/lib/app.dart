import 'package:care_garden/utils/rotas.dart';
import 'package:care_garden/views/screens/agendamento_formulario.dart';
import 'package:care_garden/views/screens/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CareGarden',
      routes: {
        Rotas.agendamentoFormulario: (ctx) => AgendamentoFormulario(),
      },
      home: Home(),
    );
  }
}
