import 'package:caregarden_cmd/modelos/planta/angiospermas.dart';
import 'package:caregarden_cmd/modelos/planta/briofitas.dart';
import 'package:caregarden_cmd/modelos/planta/gimnospermas.dart';
import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/modelos/planta/pteridofitas.dart';
import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';

abstract class FabricaDePlanta {
  static Planta fabricarPlanta(
    int? id,
    String nome,
    GrupoPlanta grupo,
  ) {
    late Planta p;
    switch (grupo) {
      case GrupoPlanta.angiosperma:
        p = Angiospermas(
          id: id,
          nome: nome,
        );
        break;
      case GrupoPlanta.briofita:
        p = Briofitas(
          id: id,
          nome: nome,
        );
        break;
      case GrupoPlanta.gimnosperma:
        p = Gimnospermas(
          id: id,
          nome: nome,
        );
        break;
      case GrupoPlanta.pteridofita:
        p = Pteridofitas(
          id: id,
          nome: nome,
        );
        break;
    }

    return p;
  }
}
