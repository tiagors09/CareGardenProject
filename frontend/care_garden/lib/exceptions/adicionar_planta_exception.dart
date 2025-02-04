class AdicionarPlantaException implements Exception {
  final String menssagem;

  AdicionarPlantaException({
    required this.menssagem,
  });

  @override
  String toString() => menssagem;
}
