import 'package:caregarden_cmd/utilitarios/agregador/plantas.dart';
import 'package:caregarden_cmd/utilitarios/enums/grupo_planta.dart';

class App {
  void rodar() {
    Plantas plantas = Plantas();
    plantas.adicionar(
      null,
      'samambaia-comum',
      DateTime.now(),
      GrupoPlanta.pteridofita,
    );
  }
}
