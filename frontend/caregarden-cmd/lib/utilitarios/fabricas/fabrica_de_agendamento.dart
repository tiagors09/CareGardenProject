import 'package:caregarden_cmd/modelos/agendamento/adubacao.dart';
import 'package:caregarden_cmd/modelos/agendamento/agendamento.dart';
import 'package:caregarden_cmd/modelos/agendamento/podamento.dart';
import 'package:caregarden_cmd/modelos/agendamento/regamento.dart';
import 'package:caregarden_cmd/modelos/agendamento/replantio.dart';
import 'package:caregarden_cmd/modelos/agendamento/troca_de_vaso.dart';
import 'package:caregarden_cmd/utilitarios/enums/evento.dart';

abstract class FabricaDeAgendamento {
  static Agendamento fabricarPlanta(
    int? id,
    int planta,
    DateTime data,
    Evento evento,
  ) {
    late Agendamento a;
    switch (evento) {
      case Evento.adubacao:
        a = Adubacao(
          id: id,
          planta: planta,
          data: data,
          evento: evento,
        );
        break;
      case Evento.podamento:
        a = Podamento(
          id: id,
          planta: planta,
          data: data,
          evento: evento,
        );
        break;
      case Evento.regamento:
        a = Regamento(
          id: id,
          planta: planta,
          data: data,
          evento: evento,
        );
        break;
      case Evento.replantio:
        a = Replantio(
          id: id,
          planta: planta,
          data: data,
          evento: evento,
        );
        break;
      case Evento.trocaDeVaso:
        a = TrocaDeVaso(
          id: id,
          planta: planta,
          data: data,
          evento: evento,
        );
        break;
    }

    return a;
  }
}
