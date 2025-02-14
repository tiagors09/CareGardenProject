import 'package:care_garden/models/planta.dart';
import 'package:flutter/material.dart';

class PlantaListaItem extends StatelessWidget {
  final Planta planta;
  final void Function(BuildContext, Planta) funcaoEdicaoPlanta;

  const PlantaListaItem({
    super.key,
    required this.planta,
    required this.funcaoEdicaoPlanta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          onPressed: () => funcaoEdicaoPlanta(context, planta),
          icon: Icon(Icons.edit),
        ),
        title: Text(planta.nome),
      ),
    );
  }
}
