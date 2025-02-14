import 'package:caregarden_cmd/modelos/planta/angiospermas.dart';
import 'package:caregarden_cmd/modelos/planta/briofitas.dart';
import 'package:caregarden_cmd/modelos/planta/gimnospermas.dart';
import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/modelos/planta/pteridofitas.dart';
import 'package:caregarden_cmd/utilitarios/grupo_planta.dart';

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
