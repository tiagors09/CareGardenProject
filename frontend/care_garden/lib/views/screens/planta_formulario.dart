import 'package:care_garden/controllers/planta_formulario_controlador.dart';
import 'package:flutter/material.dart';

class PlantaFormulario extends StatefulWidget {
  final PlantaFormularioControlador controlador;

  const PlantaFormulario({
    super.key,
    required this.controlador,
  });

  @override
  State<PlantaFormulario> createState() => _PlantaFormularioState();
}

class _PlantaFormularioState extends State<PlantaFormulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forumlário Planta'),
      ),
      body: Center(
        child: Text(
          'Formulário aqui',
        ),
      ),
    );
  }
}
