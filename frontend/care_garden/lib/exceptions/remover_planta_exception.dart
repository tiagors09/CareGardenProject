class RemoverPlantaException implements Exception {
  final String menssagem;

  RemoverPlantaException({
    required this.menssagem,
  });

  @override
  String toString() => menssagem;
}
