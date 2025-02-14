import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/agregador/agregador.dart';
import 'package:caregarden_cmd/utilitarios/iterador/planta_iterador.dart';

class Plantas extends Agregador<PlantaIterador> {
  final List<Planta> plantas = [];
  final int indiceAtual = -1;

  @override
  PlantaIterador geraIterador() {
    // TODO: implement geraIterador
    throw UnimplementedError();
  }
}
