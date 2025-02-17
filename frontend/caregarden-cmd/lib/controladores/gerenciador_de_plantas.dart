import 'package:caregarden_cmd/controladores/repositorio.dart';
import 'package:caregarden_cmd/modelos/planta/planta.dart';
import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';
import 'package:caregarden_cmd/utilitarios/fabricas/fabrica_de_planta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GerenciadorDePlantas implements Repositorio<Planta> {
  final _baseUrl = 'http://localhost:8080/plantas';

  @override
  bool deletar(int id) {
    http.delete(Uri.parse('$_baseUrl/\$id')).then((resposta) {
      if (resposta.statusCode == 200) {
        print('Planta deletada com sucesso');
        return true;
      } else {
        print('Erro ao deletar planta: \${resposta.body}');
        return false;
      }
    }).onError((error, stackTrace) {
      print('Erro ao deletar planta: \$error');
      return false;
    });
    return false;
  }

  @override
  Planta obterPorId(int id) {
    Planta plantaPadrao = FabricaDePlanta.fabricarPlanta(
        0, 'Desconhecida', GrupoPlanta.angiosperma);
    http.get(Uri.parse('$_baseUrl/\$id')).then((resposta) {
      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body);
        final grupo = GrupoPlanta.values.firstWhere(
          (e) => e.nome == dados['grupo'],
          orElse: () => GrupoPlanta.angiosperma,
        );
        return FabricaDePlanta.fabricarPlanta(
          dados['id'],
          dados['nome'],
          grupo,
        );
      } else {
        print('Erro ao obter planta por ID: \${resposta.body}');
        return plantaPadrao;
      }
    }).onError((error, stackTrace) {
      print('Erro ao obter planta por ID: \$error');
      return plantaPadrao;
    });
    return plantaPadrao;
  }

  @override
  List<Planta> obterTodos() {
    http.get(Uri.parse(_baseUrl)).then((resposta) {
      if (resposta.statusCode == 200) {
        List<dynamic> dados = jsonDecode(resposta.body);
        return dados.map((e) {
          final grupo = GrupoPlanta.values.firstWhere(
            (g) => g.nome == e['grupo'],
            orElse: () => GrupoPlanta.angiosperma,
          );
          return FabricaDePlanta.fabricarPlanta(e['id'], e['nome'], grupo);
        }).toList();
      } else {
        print('Erro ao obter todas as plantas: \${resposta.body}');
        return [];
      }
    }).onError((error, stackTrace) {
      print('Erro ao obter todas as plantas: \$error');
      return [];
    });
    return [];
  }

  @override
  bool salvar(Planta objeto) {
    http
        .post(
      Uri.parse('$_baseUrl/salvar'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(objeto.toJson()),
    )
        .then((resposta) {
      if (resposta.statusCode == 200 || resposta.statusCode == 201) {
        print('Planta salva com sucesso');
        return true;
      } else {
        print('Erro ao salvar planta: \${resposta.body}');
        return false;
      }
    }).onError((error, stackTrace) {
      print('Erro ao salvar planta: \$error');
      return false;
    });
    return false;
  }

  @override
  bool atualizar(Planta objeto) {
    http
        .put(
      Uri.parse('$_baseUrl/\${objeto.id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(objeto.toJson()),
    )
        .then((resposta) {
      if (resposta.statusCode == 200) {
        print('Planta atualizada com sucesso');
        return true;
      } else {
        print('Erro ao atualizar planta: \${resposta.body}');
        return false;
      }
    }).onError((error, stackTrace) {
      print('Erro ao atualizar planta: \$error');
      return false;
    });
    return false;
  }
}
