import 'package:care_garden/models/planta.dart';
import 'package:care_garden/utils/rotas.dart';
import 'package:flutter/material.dart';

class ListaPlantasControlador {
  void editarPlanta(BuildContext ctx, Planta p) {
    Navigator.pushNamed(ctx, Rotas.plantaFormulario, arguments: p);
  }
}
