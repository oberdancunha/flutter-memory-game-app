import 'package:flutter_modular/flutter_modular.dart';

import '../game/game_module.dart';
import 'app_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const AppPage(),
      children: [
        ModuleRoute(
          '/game',
          module: GameModule(),
        ),
      ],
    ),
  ];
}
