import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/misc/card_type_menu.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    final cardTypeMenuFirstItem = const CardTypeMenu().list().get(0);
    Modular.to.navigate(
      '/game',
      arguments: [
        cardTypeMenuFirstItem.name,
        cardTypeMenuFirstItem.cardDataSource,
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: RouterOutlet(),
      );
}
