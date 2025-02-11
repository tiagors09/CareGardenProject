import 'package:care_garden/models/planta.dart';
import 'package:flutter/material.dart';

class PlantaListaItem extends StatelessWidget {
  final Planta p;
  final void Function(BuildContext, Planta) funcaoEdicaoPlanta;

  const PlantaListaItem({
    super.key,
    required this.p,
    required this.funcaoEdicaoPlanta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          onPressed: () => funcaoEdicaoPlanta(context, p),
          icon: Icon(Icons.edit),
        ),
        title: Text(p.nome),
      ),
    );
  }
}
