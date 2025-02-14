enum Evento {
  regamento('Regamento'),
  podamento('Podamento'),
  adubacao('Adubação'),
  trocaDeVaso('Troca de Vaso'),
  replantio('Replantio');

  final String nome;

  const Evento(this.nome);
}
