class ObterDetalhePlantaException implements Exception {
  final String menssagem;

  ObterDetalhePlantaException({
    required this.menssagem,
  });

  @override
  String toString() => menssagem;
}
