import 'package:care_garden/models/planta.dart';
import 'package:care_garden/utils/tipo_planta.dart';

class Pteridofitas extends Planta {
  Pteridofitas({
    super.id,
    required super.nome,
    required super.dataDeAquisicao,
    super.tipoPlanta = TipoPlanta.pteridofita,
  });
}
