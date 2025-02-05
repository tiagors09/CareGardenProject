import 'package:flutter/material.dart';

class AgendamentoFormulario extends StatefulWidget {
  const AgendamentoFormulario({super.key});

  @override
  State<AgendamentoFormulario> createState() => _AgendamentoFormularioState();
}

class _AgendamentoFormularioState extends State<AgendamentoFormulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Agendamento'),
      ),
      body: Center(
        child: Text('Formulário Agendamento'),
      ),
    );
  }
}
