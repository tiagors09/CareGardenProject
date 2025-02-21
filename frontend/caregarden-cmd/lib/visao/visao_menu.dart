import 'dart:io';

import 'package:caregarden_cmd/visao/visao.dart';

class VisaoMenu {
  final Visao visaoPlantas;

  VisaoMenu({
    required this.visaoPlantas,
  });

  void exibirCabecalho() {
    print("#####################");
    print('#    CARE GARDEN    #');
    print("#####################");
  }

  void exibirMenus() {
    exibirCabecalho();
    print('1 - Menu plantas');
    print('2 - Menu agendamentos');

    final opcao = stdin.readLineSync();
    final opcaoConvertida = int.tryParse(opcao ?? '');

    if (opcaoConvertida.toString().trim().isEmpty) {
      print('Digite uma entrada válida!');
    } else {
      switch (opcaoConvertida) {
        case 1:
          exibirMenuPlantas();
          break;
        case 2:
          break;
        default:
          print('Digite uma entrada válida!');
          break;
      }
    }
  }

  void exibirMenuPlantas() {
    print('1 - Adicionar planta');
    print('2 - Atualizar planta');
    print('3 - Ler planta');
    print('4 - Remover planta');
    print('5 - Listar plantas');

    final opcao = stdin.readLineSync();
    final opcaoConvertida = int.tryParse(opcao ?? '');

    if (opcaoConvertida.toString().trim().isEmpty) {
      print('Digite uma entrada válida!');
    } else {
      switch (opcaoConvertida) {
        case 1:
          visaoPlantas.adicionar();
          break;
        case 2:
          print('Digite um ID de uma planta para atualizar ');
          final plantaId = stdin.readLineSync();
          final plantaIdConvertida = int.tryParse(plantaId ?? '');

          if (plantaIdConvertida.toString().trim().isEmpty ||
              plantaIdConvertida == null) {
            print('Digite uma entrada válida!');
          } else {
            visaoPlantas.atualizar(plantaIdConvertida);
          }
          break;
        case 3:
          print('Digite um ID de uma planta para ler ');
          final plantaId = stdin.readLineSync();
          final plantaIdConvertida = int.tryParse(plantaId ?? '');

          if (plantaIdConvertida.toString().trim().isEmpty ||
              plantaIdConvertida == null) {
            print('Digite uma entrada válida!');
          } else {
            visaoPlantas.exibir(plantaIdConvertida);
          }
          break;
        case 4:
          print('Digite um ID de uma planta para remover ');
          final plantaId = stdin.readLineSync();
          final plantaIdConvertida = int.tryParse(plantaId ?? '');

          if (plantaIdConvertida.toString().trim().isEmpty ||
              plantaIdConvertida == null) {
            print('Digite uma entrada válida!');
          } else {
            visaoPlantas.excluir(plantaIdConvertida);
          }
          break;
        case 5:
          print('LISTA DE PLANTAS');
          visaoPlantas.listar();
          break;
        default:
          print('Digite uma entrada válida!');
          break;
      }
    }
  }
}
