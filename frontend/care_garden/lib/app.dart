import 'package:care_garden/controllers/agendamento_formulario_controlador.dart';
import 'package:care_garden/controllers/planta_formulario_controlador.dart';
import 'package:care_garden/providers/planta/planta_provider.dart';
import 'package:care_garden/utils/rotas.dart';
import 'package:care_garden/views/screens/agendamento_formulario.dart';
import 'package:care_garden/views/screens/home.dart';
import 'package:care_garden/views/screens/planta_formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlantaProvider>(
          create: (_) {
            final plantaProvider = PlantaProvider();
            plantaProvider.requisitarPlantas();

            return plantaProvider;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CareGarden',
        routes: {
          Rotas.agendamentoFormulario: (ctx) => AgendamentoFormulario(
                controlador: AgendamentoFormularioControlador(),
              ),
          Rotas.plantaFormulario: (ctx) => PlantaFormulario(
                controlador: PlantaFormularioControlador(),
              ),
        },
        home: Home(),
      ),
    );
  }
}
