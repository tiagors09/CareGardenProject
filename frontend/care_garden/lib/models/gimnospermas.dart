import 'package:care_garden/models/planta.dart';
import 'package:care_garden/utils/tipo_planta.dart';

class Gimnospermas extends Planta {
  Gimnospermas({
    super.id,
    required super.nome,
    required super.dataDeAquisicao,
    super.tipoPlanta = TipoPlanta.gimnosperma,
  });
}
