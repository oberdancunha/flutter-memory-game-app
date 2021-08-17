import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/card/kids_activities_data_source.dart';
import 'widgets/choose_type_cards_widget.dart';
import 'widgets/header_widget.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
    Modular.to.navigate(
      '/game',
      arguments: [
        'Brincadeira de criança',
        KidsActivitiesDataSouce(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.deepOrange.shade50,
        body: Column(
          children: [
            const HeaderWidget(),
            const ChooseTypeCardsWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: RouterOutlet(),
            ),
          ],
        ),
      );
}
