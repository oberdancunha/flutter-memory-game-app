import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/card/card_store.dart';
import '../../../data/card/animals_data_source.dart';
import '../../../data/card/country_flags_data_source.dart';
import '../../../data/card/kids_activities_data_source.dart';
import '../../../data/card/music_instruments_data_source.dart';
import '../../../infrastructure/card/card_data_source.dart';

class ChooseTypeCardsWidget extends StatelessWidget {
  const ChooseTypeCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: ScreenUtil().setHeight(120),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildOptions(
              context: context,
              title: 'Brincadeiras de criança',
              image: 'assets/images/cards_types/kids_activities.png',
              cardDataSource: KidsActivitiesDataSouce(),
            ),
            _buildOptions(
              context: context,
              title: 'Animais',
              image: 'assets/images/cards_types/animals.png',
              cardDataSource: AnimalsDataSouce(),
            ),
            _buildOptions(
              context: context,
              title: 'Bandeiras de países',
              image: 'assets/images/cards_types/country_flags.png',
              cardDataSource: CountryFlagsDataSouce(),
            ),
            _buildOptions(
              context: context,
              title: 'Instrumentos musicais',
              image: 'assets/images/cards_types/music_instruments.png',
              cardDataSource: MusicInstrumentsDataSouce(),
            ),
          ],
        ),
      );

  Widget _buildOptions({
    required BuildContext context,
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
          width: MediaQuery.of(context).size.width / 4,
          child: Card(
            color: Colors.brown,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage(image),
                  width: ScreenUtil().setWidth(50),
                ),
                SizedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
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
