import 'dart:io';

import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';
import 'package:caregarden_cmd/utilitarios/fabricas/fabrica_de_planta.dart';
import 'package:caregarden_cmd/visao/visao.dart';

class VisaoPlantas extends Visao {
  VisaoPlantas({
    required super.repositorio,
  });

  @override
  void atualizar(int id) {
    final planta = repositorio.obterPorId(id) as Planta;
    print('Atualizar planta ${planta.toString()}');

    String nome = '';
    String data = '';
    String grupoOp = '';

    while (nome.trim().isEmpty) {
      print('Digite o nome da planta');
      nome = stdin.readLineSync() ?? '';
    }

    while (data.trim().isEmpty) {
      print('Digite a data de aquisição da planta');
      data = stdin.readLineSync() ?? '';
    }

    final dataDeAquisicao = DateTime.tryParse(data) ?? DateTime.now();

    while (grupoOp.trim().isEmpty) {
      print('Qual o grupo da planta?');
      print('1 - Briófitas');
      print('2 - Pteridófitas');
      print('3 - Gimnosperma');
      print('4 - Angiospermas');

      grupoOp = stdin.readLineSync() ?? '';
    }

    final grupoOpConvertido = int.parse(grupoOp);
    GrupoPlanta? grupo;

    switch (grupoOpConvertido) {
      case 1:
        grupo = GrupoPlanta.briofita;
        break;
      case 2:
        grupo = GrupoPlanta.pteridofita;
        break;
      case 3:
        grupo = GrupoPlanta.gimnosperma;
        break;
      case 4:
        grupo = GrupoPlanta.angiosperma;
        break;
      default:
        break;
    }

    final resposta = repositorio.salvar(
      FabricaDePlanta.fabricarPlanta(
        planta.id,
        nome,
        dataDeAquisicao,
        grupo!,
      ),
    );

    if (resposta) {
      print('Atualização deu certo');
    } else {
      print('Falha na atualização de planta');
    }
  }

  @override
  void excluir(int id) {
    final resultado = repositorio.deletar(id);
    print(
      resultado ? 'Planta removida com sucesso!' : 'Falha ao remover planta',
    );
  }

  @override
  void exibir(int id) {
    final planta = repositorio.obterPorId(id);
    print(planta.toString());
  }

  @override
  void listar() {
    repositorio.obterTodos().forEach(
          (planta) => print(
            (planta as Planta).caracteristicas(),
          ),
        );
  }

  @override
  void adicionar() {
    String nome = '';
    String data = '';
    String grupoOp = '';

    while (nome.trim().isEmpty) {
      print('Digite o nome da planta');
      nome = stdin.readLineSync() ?? '';
    }

    while (data.trim().isEmpty) {
      print('Digite a data de aquisição da planta');
      data = stdin.readLineSync() ?? '';
    }

    final dataDeAquisicao = DateTime.tryParse(data) ?? DateTime.now();

    while (grupoOp.trim().isEmpty) {
      print('Qual o grupo da planta?');
      print('1 - Briófitas');
      print('2 - Pteridófitas');
      print('3 - Gimnosperma');
      print('4 - Angiospermas');

      grupoOp = stdin.readLineSync() ?? '';
    }

    final grupoOpConvertido = int.parse(grupoOp);
    GrupoPlanta? grupo;

    switch (grupoOpConvertido) {
      case 1:
        grupo = GrupoPlanta.briofita;
        break;
      case 2:
        grupo = GrupoPlanta.pteridofita;
        break;
      case 3:
        grupo = GrupoPlanta.gimnosperma;
        break;
      case 4:
        grupo = GrupoPlanta.angiosperma;
        break;
      default:
        break;
    }

    final resultado = repositorio.salvar(
      FabricaDePlanta.fabricarPlanta(
        null,
        nome,
        dataDeAquisicao,
        grupo!,
      ),
    );

    if (resultado) {
      print('Inserção deu certo');
    } else {
      print('Falha na adição de planta');
    }
  }
}
