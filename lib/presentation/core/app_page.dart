import 'package:flutter/material.dart';

import '../game/game_page.dart';
import 'widgets/choose_type_cards_widget.dart';
import 'widgets/header_widget.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.deepOrange.shade50,
        body: Column(
          children: const [
            HeaderWidget(),
            SizedBox(height: 10),
            ChooseTypeCardsWidget(),
            SizedBox(height: 10),
            GamePage(),
          ],
        ),
      );
}
