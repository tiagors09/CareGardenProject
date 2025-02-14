// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/iterador/iterador.dart';

class PlantaIterador extends Iterador<PlantaIterador, Planta> {
  final List<Planta> plantas;
  final int indiceAtual;

  PlantaIterador({
    required this.plantas,
    required this.indiceAtual,
  });

  @override
  Planta atual() {
    // TODO: implement atual
    throw UnimplementedError();
  }

  @override
  PlantaIterador proximo() {
    // TODO: implement proximo
    throw UnimplementedError();
  }

  @override
  bool temProximo() {
    // TODO: implement temProximo
    throw UnimplementedError();
  }
}
