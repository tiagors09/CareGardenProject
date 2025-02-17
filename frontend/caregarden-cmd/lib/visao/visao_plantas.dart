import 'dart:io';
import 'dart:math';

import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';
import 'package:caregarden_cmd/utilitarios/fabricas/fabrica_de_planta.dart';
import 'package:caregarden_cmd/visao/visao.dart';

class VisaoPlantas extends Visao {
  VisaoPlantas({
    required super.repositorio,
  });

  @override
  void atualizar(int id) {
    // TODO: implement atualizar
  }

  @override
  void excluir(int id) {
    // TODO: implement excluir
  }

  @override
  void exibir(int id) {
    // TODO: implement exibir
  }

  @override
  void listar() {
    // TODO: implement listar
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
        Random().nextInt(100),
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
