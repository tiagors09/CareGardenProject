import 'package:care_garden/models/angiospermas.dart';
import 'package:care_garden/models/briofitas.dart';
import 'package:care_garden/models/gimnospermas.dart';
import 'package:care_garden/models/planta.dart';
import 'package:care_garden/models/pteridofitas.dart';
import 'package:care_garden/utils/tipo_planta.dart';

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
