enum MensagensExcecoes {
  adicionarPlantaExcecai('Falha ao adicionar planta'),
  atuliazarPlantaExcecai('Falha ao atualizar planta'),
  listarTodasPlantasExcecao('Falha ao listar plantas'),
  obterDetalhePlantaExcecao('Falha ao obter detalhes da planta'),
  removerPlantaExcecao('Falha ao remover planta');

  final String mensagem;

  const MensagensExcecoes(this.mensagem);
}
