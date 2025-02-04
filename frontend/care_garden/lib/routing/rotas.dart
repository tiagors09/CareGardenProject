import 'package:care_garden/utils/enums.dart';

abstract class Rotas {
  static final config = {
    RotasNomes.home: (ctx) => null,
    RotasNomes.calendario: (ctx) => null,
    RotasNomes.detalhePlanta: (ctx) => null,
    RotasNomes.listaPlantas: (ctx) => null,
  };
}
