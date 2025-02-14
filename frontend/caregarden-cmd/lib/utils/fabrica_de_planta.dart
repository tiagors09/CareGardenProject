import 'package:caregarden_cmd/models/planta/angiospermas.dart';
import 'package:caregarden_cmd/models/planta/briofitas.dart';
import 'package:caregarden_cmd/models/planta/gimnospermas.dart';
import 'package:caregarden_cmd/models/planta/planta.dart';
import 'package:caregarden_cmd/models/planta/pteridofitas.dart';
import 'package:caregarden_cmd/utils/grupo_planta.dart';

abstract class FabricaDePlanta {
  static Planta fabricarPlanta(
    String nome,
    DateTime dataDeAquisicao,
    GrupoPlanta grupo,
  ) {
    late Planta p;
    switch (grupo) {
      case GrupoPlanta.angiosperma:
        p = Angiospermas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
      case GrupoPlanta.briofita:
        p = Briofitas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
      case GrupoPlanta.gimnosperma:
        p = Gimnospermas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
      case GrupoPlanta.pteridofita:
        p = Pteridofitas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
    }

    return p;
  }
}
