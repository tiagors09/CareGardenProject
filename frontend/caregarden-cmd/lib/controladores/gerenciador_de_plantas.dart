import 'dart:convert';

import 'package:caregarden_cmd/controladores/repositorio.dart';
import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:http/http.dart' as http;

class GerenciadorDePlantas implements Repositorio<Planta> {
  final _plantas = <Planta>[];
  final _baseUrl = 'http://localhost:8080/plantas';

  @override
  bool deletar(int id) {
    _plantas.removeWhere((planta) => planta.id == id);
    return true;
  }

  @override
  Planta obterPorId(int id) {
    final planta = _plantas.firstWhere((planta) => planta.id == id);
    return planta;
  }

  @override
  List<Planta> obterTodos() {
    return _plantas;
  }

  @override
  bool salvar(Planta objeto) {
    final planta = objeto.toJson();
    final chave = planta.remove('id');
    print(planta);

    final resposta = http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(planta),
    );

    bool retorno = false;

    resposta.then(
      (res) {
        print(res.toString());
        retorno = true;
      },
    ).onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        retorno = false;
      },
    );

    return false;
  }

  @override
  bool atualizar(Planta objeto) {
    try {
      final resposta = http.patch(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          objeto.toJson().remove('id'),
        ),
      );

      resposta.then((res) {
        if (res.statusCode == 200 || res.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      });
    } catch (_) {
      return false;
    }
    return false;
  }
}
