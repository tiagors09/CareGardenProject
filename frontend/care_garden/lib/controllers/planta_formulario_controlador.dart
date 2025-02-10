import 'package:flutter/material.dart';

class PlantaFormularioControlador {
  Future<DateTime?> abrirModalSelecaoData(BuildContext ctx) {
    return showDatePicker(
      context: ctx,
      firstDate: DateTime.utc(DateTime.now().year, 01, 01),
      lastDate: DateTime.utc(DateTime.now().year, 12, 31),
    );
  }

  void selecionarImage() {}
}
