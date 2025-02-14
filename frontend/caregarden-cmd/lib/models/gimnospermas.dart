import 'package:caregarden_cmd/models/planta.dart';
import 'package:caregarden_cmd/utils/tipo_planta.dart';

class Gimnospermas extends Planta {
  Gimnospermas({
    super.id,
    required super.nome,
    required super.dataDeAquisicao,
    super.tipoPlanta = TipoPlanta.gimnosperma,
  });
}
