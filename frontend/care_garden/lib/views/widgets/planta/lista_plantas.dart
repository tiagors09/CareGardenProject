import 'package:care_garden/controllers/lista_plantas_controlador.dart';
import 'package:care_garden/models/planta.dart';
import 'package:care_garden/views/widgets/planta/planta_lista_item.dart';
import 'package:flutter/material.dart';

class ListaPlantas extends StatelessWidget {
  final List<Planta> plantas;
  final ListaPlantasControlador controlador;

  const ListaPlantas({
    super.key,
    required this.plantas,
    required this.controlador,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: plantas.length,
        itemBuilder: (ctx, i) {
          return PlantaListaItem(
            p: plantas[i],
            funcaoEdicaoPlanta: controlador.editarPlanta,
          );
        },
      ),
    );
  }
}
