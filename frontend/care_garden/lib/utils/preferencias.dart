import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static final Preferencias _instancia = Preferencias._();

  Preferencias._();

  static Preferencias obterInstancia() {
    return _instancia;
  }

  void salvarTema(ThemeMode tema) {
    SharedPreferences.getInstance().then((sp) {
      sp.setString('tema', tema.name);
    });
  }

  ThemeMode obterTema() {
    late ThemeMode tema;

    SharedPreferences.getInstance().then(
      (sp) {
        String? spTema = sp.getString('tema');

        spTema ??= 'light';

        switch (spTema) {
          case 'dark':
            tema = ThemeMode.dark;
            break;
          case 'light':
            tema = ThemeMode.light;
            break;
        }
      },
    );

    return tema;
  }
}
