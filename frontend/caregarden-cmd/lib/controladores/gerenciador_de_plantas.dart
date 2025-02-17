import 'package:caregarden_cmd/controladores/repositorio.dart';
import 'package:caregarden_cmd/modelos/planta/planta.dart';

class GerenciadorDePlantas implements Repositorio<Planta> {
  final _plantas = <Planta>[];
  final _baseUrl = 'http://localhost:8080';

  @override
  bool deletar(int id) {
    _plantas.removeWhere((planta) => planta.id == id);
    return true;
  }

  @override
  Planta obterPorId(int id) {
    final planta = _plantas.firstWhere((planta) => planta.id == id);
    return planta;
  }

  @override
  List<Planta> obterTodos() {
    return _plantas;
  }

  @override
  bool salvar(Planta objeto) {
    _plantas.add(objeto);
    return true;
  }
}
