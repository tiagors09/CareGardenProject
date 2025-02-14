import 'package:care_garden/utils/rotas.dart';
import 'package:care_garden/utils/tipo_planta.dart';
import 'package:flutter/material.dart';

class HomeControlador {
  void _abrirFormularioPlantas(BuildContext ctx, TipoPlanta tipo) {
    Navigator.of(ctx).pushNamed(
      Rotas.plantaFormulario,
      arguments: [
        null,
        TipoPlanta.pteridofita,
      ],
    );
  }

  void mostrarModalPlantas(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ListView(
          children: [
            TextButton.icon(
              onPressed: () =>
                  _abrirFormularioPlantas(ctx, TipoPlanta.pteridofita),
              label: Text('Adicionar Pteridófita'),
            ),
            TextButton.icon(
              onPressed: () =>
                  _abrirFormularioPlantas(ctx, TipoPlanta.briofita),
              label: Text('Adicionar Briófita'),
            ),
            TextButton.icon(
              onPressed: () =>
                  _abrirFormularioPlantas(ctx, TipoPlanta.gimnosperma),
              label: Text('Adicionar Gimnosperma'),
            ),
            TextButton.icon(
              onPressed: () =>
                  _abrirFormularioPlantas(ctx, TipoPlanta.angiosperma),
              label: Text('Adicionar Angiosperma'),
            ),
          ],
        );
      },
    );
  }
}
