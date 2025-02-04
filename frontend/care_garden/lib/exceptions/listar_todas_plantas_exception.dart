class ListarTodasPlantasException implements Exception {
  final String menssagem;

  ListarTodasPlantasException(
    this.menssagem,
  );

  @override
  String toString() => menssagem;
}
