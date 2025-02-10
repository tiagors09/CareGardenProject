import 'package:flutter/material.dart';

class PlantaFormularioControlador {
  void salvarPlanta() {}

  String? validacaoNomePlanta(String? texto) {
    if (texto!.trim().isEmpty) {
      return 'Informe um título válido!';
    }

    if (texto.trim().length < 3) {
      return 'Informe um título com no mínimo 3 letras!';
    }

    return null;
  }

  Future<DateTime?> abrirModalSelecaoData(BuildContext ctx) {
    return showDatePicker(
      context: ctx,
      firstDate: DateTime.utc(DateTime.now().year, 01, 01),
      lastDate: DateTime.utc(DateTime.now().year, 12, 31),
    );
  }

  void selecionarImage() {}
}
