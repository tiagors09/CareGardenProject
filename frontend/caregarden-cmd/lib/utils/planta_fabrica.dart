import 'package:caregarden_cmd/models/angiospermas.dart';
import 'package:caregarden_cmd/models/briofitas.dart';
import 'package:caregarden_cmd/models/gimnospermas.dart';
import 'package:caregarden_cmd/models/planta.dart';
import 'package:caregarden_cmd/models/pteridofitas.dart';
import 'package:caregarden_cmd/utils/tipo_planta.dart';

abstract class PlantaFabrica {
  static Planta fabricaPlanta(
    String nome,
    DateTime dataDeAquisicao,
    TipoPlanta tipoPlanta,
  ) {
    late Planta p;
    switch (tipoPlanta) {
      case TipoPlanta.angiosperma:
        p = Angiospermas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
      case TipoPlanta.briofita:
        p = Briofitas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
      case TipoPlanta.gimnosperma:
        p = Gimnospermas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
      case TipoPlanta.pteridofita:
        p = Pteridofitas(nome: nome, dataDeAquisicao: dataDeAquisicao);
        break;
    }

    return p;
  }
}
