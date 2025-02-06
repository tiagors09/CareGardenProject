import 'package:flutter/material.dart';

class PlantaListaItem extends StatelessWidget {
  final String nomePlanta;
  final String caminhoFoto;

  const PlantaListaItem({
    super.key,
    required this.nomePlanta,
    required this.caminhoFoto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nomePlanta),
        leading: Image.network(
          caminhoFoto,
          loadingBuilder: (context, child, loadingProgress) =>
              CircularProgressIndicator(),
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.yard_outlined),
        ),
      ),
    );
  }
}
