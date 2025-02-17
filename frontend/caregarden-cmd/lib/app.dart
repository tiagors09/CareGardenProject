import 'package:caregarden_cmd/controladores/gerenciador_de_plantas.dart';
import 'package:caregarden_cmd/visao/visao_menu.dart';
import 'package:caregarden_cmd/visao/visao_plantas.dart';

class App {
  void rodar() {
    final visao = VisaoMenu(
      visaoPlantas: VisaoPlantas(
        repositorio: GerenciadorDePlantas(),
      ),
    );

    while (true) {
      visao.exibirMenus();
    }
  }
}
