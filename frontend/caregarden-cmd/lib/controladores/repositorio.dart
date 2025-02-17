abstract class Repositorio<T> {
  bool salvar(T objeto);
  List<T> obterTodos();
  T obterPorId(int id);
  bool deletar(int id);
  bool atualizar(T objeto);
}
