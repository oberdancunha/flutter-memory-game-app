import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/card/kids_activities_data_source.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    Modular.to.navigate(
      '/game',
      arguments: [
        'Brincadeiras de criança',
        KidsActivitiesDataSource(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: RouterOutlet(),
      );
}
