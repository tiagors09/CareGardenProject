import 'package:care_garden/controllers/agendamento_formulario_controlador.dart';
import 'package:flutter/material.dart';

class AgendamentoFormulario extends StatefulWidget {
  final AgendamentoFormularioControlador controlador;

  const AgendamentoFormulario({
    super.key,
    required this.controlador,
  });

  @override
  State<AgendamentoFormulario> createState() => _AgendamentoFormularioState();
}

class _AgendamentoFormularioState extends State<AgendamentoFormulario> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Agendamento'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [],
        ),
      ),
    );
  }
}
