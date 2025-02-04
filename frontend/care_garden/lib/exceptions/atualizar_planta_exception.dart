class AtualizarPlantaException implements Exception {
  final String menssagem;

  AtualizarPlantaException({
    required this.menssagem,
  });

  @override
  String toString() => menssagem;
}
