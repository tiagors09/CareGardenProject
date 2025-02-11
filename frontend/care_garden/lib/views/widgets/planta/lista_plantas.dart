import 'package:care_garden/controllers/lista_plantas_controlador.dart';
import 'package:care_garden/models/planta.dart';
import 'package:care_garden/providers/planta/planta_provider.dart';
import 'package:care_garden/views/widgets/planta/planta_lista_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaPlantas extends StatelessWidget {
  final ListaPlantasControlador controlador;

  const ListaPlantas({
    super.key,
    required this.controlador,
  });

  @override
  Widget build(BuildContext context) {
    final provedor = Provider.of<PlantaProvider>(context);
    return FutureBuilder(
      future: provedor.requisitarPlantas(),
      builder: (ctx, snp) {
        if (snp.hasData && snp.connectionState == ConnectionState.done) {
          final plantas = provedor.plantas;
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

        if (snp.hasError && snp.connectionState == ConnectionState.done) {
          return Center(
            child: Text('Falha ao obter plantas'),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
