import 'package:caregarden_cmd/controladores/repositorio.dart';
import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/agregador/agregador.dart';
import 'package:caregarden_cmd/utilitarios/agregador/plantas.dart';

class GerenciadorDePlantas implements Repositorio<Planta> {
  final Agregador agregador;

  GerenciadorDePlantas({
    required this.agregador,
  });

  @override
  bool deletar(int id) {
    // TODO: implement deletar
    throw UnimplementedError();
  }

  @override
  Planta obterPorId(int id) {
    // TODO: implement obterPorId
    throw UnimplementedError();
  }

  @override
  List<Planta> obterTodos() {
    // TODO: implement obterTodos
    throw UnimplementedError();
  }

  @override
  bool salvar(Planta objeto) {
    (agregador as Plantas).adicionar(objeto);
    return true;
  }
}
