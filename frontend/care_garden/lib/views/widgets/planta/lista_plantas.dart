import 'package:care_garden/models/planta.dart';
import 'package:care_garden/views/widgets/planta/planta_lista_item.dart';
import 'package:flutter/material.dart';

class ListaPlantas extends StatelessWidget {
  final List<Planta> plantas;

  const ListaPlantas({
    super.key,
    required this.plantas,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: plantas.length,
        itemBuilder: (ctx, i) {
          return PlantaListaItem(
            nomePlanta: plantas[i].nome,
            caminhoFoto: plantas[i].caminhoFoto,
          );
        },
      ),
    );
  }
}
