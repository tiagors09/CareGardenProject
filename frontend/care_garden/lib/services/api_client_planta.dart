import 'dart:convert';

import 'package:care_garden/exceptions/listar_todas_plantas_exception.dart';
import 'package:care_garden/models/planta.dart';
import 'package:care_garden/utils/mensagens_excecoes.dart';
import 'package:http/http.dart' as http;

class ApiClientPlanta {
  final String baseUrl;

  ApiClientPlanta({
    required this.baseUrl,
  });

  Future<List<Planta>> listarPlantas(String caminho) async {
    try {
      final resposta = await http.get(
        Uri.parse(baseUrl + caminho),
      );

      final corpoResposta = jsonDecode(resposta.body);

      return List.empty();
    } catch (_) {
      throw ListarTodasPlantasException(
        MensagensExcecoes.listarTodasPlantasExcecao.mensagem,
      );
    }
  }

  Future<Planta> buscarPlanta(String caminho, String id) {
    return Future.value(null);
  }

  Future<Planta> adicionarPlanta(String caminho, Planta p) {
    return Future.value(null);
  }

  Future<void> atualizarPlanta(String caminho, Planta p) {
    return Future.value(null);
  }

  Future<void> deletarPlanta(String caminho, String id) {
    return Future.value(null);
  }
}
