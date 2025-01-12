# CareGarden

## Casos de Uso Atualizados

1. **Gerenciamento de Calendário de Cuidados**

    - Usuário agenda cuidados específicos para cada planta.
    - Usuário visualiza todos os cuidados agendados em um calendário.
2. **Adição e Gerenciamento de Plantas**

    - Usuário adiciona novas plantas com detalhes específicos.
    - Usuário visualiza uma lista ou galeria de plantas.
    - Usuário pode adicionar notas sobre o estado da planta (crescimento, pragas, etc.).

## Rotas do Backend

1. **Rotas para Calendário de Cuidados**

    - `POST /agenda/regamento`: Agendar regamento.
    - `POST /agenda/podagem`: Agendar podagem.
    - `POST /agenda/adubacao`: Agendar adubação.
    - `POST /agenda/troca-vaso`: Agendar troca de vaso ou replantio.
    - `GET /agenda`: Obter todos os agendamentos.
    - `PUT /agenda/:id`: Atualizar um agendamento específico.
    - `DELETE /agenda/:id`: Remover um agendamento específico.
2. **Rotas para Gerenciamento de Plantas**

    - `POST /plantas`: Adicionar uma nova planta.
    - `GET /plantas`: Listar todas as plantas.
    - `GET /plantas/:id`: Obter detalhes de uma planta específica.
    - `PUT /plantas/:id`: Atualizar informações de uma planta.
    - `DELETE /plantas/:id`: Remover uma planta.

### Janelas para o Frontend

1. **Tela Inicial / Dashboard**

    - Resumo dos próximos cuidados agendados.
    - Acesso rápido às plantas.
2. **Tela de Calendário**

    - Visualização do calendário com todos os cuidados agendados.
    - Opção para adicionar, editar ou remover agendamentos.
3. **Tela de Detalhes da Planta**

    - Exibe informações detalhadas sobre a planta (nome, espécie, data de aquisição, foto, notas).
    - Acesso para editar ou remover a planta.
    - Visualização das notas e histórico de cuidados.
4. **Tela de Lista de Plantas**

    - Lista ou galeria de todas as plantas registradas.
    - Botão para adicionar nova planta.
