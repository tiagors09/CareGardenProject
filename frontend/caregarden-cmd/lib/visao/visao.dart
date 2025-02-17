import 'package:caregarden_cmd/controladores/repositorio.dart';

abstract class Visao {
  final Repositorio repositorio;

  Visao({
    required this.repositorio,
  });

  void adicionar();
  void exibir(int id);
  void listar();
  void atualizar(int id);
  void excluir(int id);
}
