import 'package:care_garden/models/planta.dart';
import 'package:care_garden/providers/planta/planta_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantaFormularioControlador {
  void salvarPlanta(
    BuildContext ctx,
    GlobalKey<FormState> formKey,
    Map<String, dynamic> formData,
  ) {
    bool valido = formKey.currentState!.validate();

    if (!valido) return;

    formKey.currentState!.save();

    final novaPlanta = Planta.fromJson(formData);

    final plantasProivder = Provider.of<PlantaProvider>(
      ctx,
      listen: false,
    );

    if (formData['id'] == null) {
      plantasProivder.adicionarPlanta(novaPlanta);
    } else {
      plantasProivder.atualizarPlanta(novaPlanta);
    }

    Navigator.of(ctx).pop();
  }

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
}
