import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../application/card/card_store.dart';
import '../../../data/card/kids_activities_data_source.dart';
import '../../../infrastructure/card/card_data_source.dart';

class ChooseTypeCardsWidget extends StatelessWidget {
  const ChooseTypeCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildOptions(
              title: 'Brincadeiras de criança',
              image: 'assets/images/cards_types/kids_activities.png',
              cardDataSource: KidsActivitiesDataSouce(),
            ),
          ],
        ),
      );

  Widget _buildOptions({
    required String title,
    required String image,
    required CardDataSource cardDataSource,
  }) =>
      GestureDetector(
        onTap: () {
          Modular.get<CardStore>().destroy();
          Modular.to.pushReplacementNamed(
            '/game',
            arguments: [
              title,
              cardDataSource,
            ],
          );
        },
        child: SizedBox(
          width: 110,
          child: Card(
            color: Colors.brown,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage(image)),
                SizedBox(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
