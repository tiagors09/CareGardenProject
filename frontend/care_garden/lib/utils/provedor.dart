import 'package:provider/provider.dart';

abstract class Provedor {
  static final config = [
    ChangeNotifierProvider(
      create: (ctx) => null,
    )
  ];
}
