import 'package:kt_dart/collection.dart';

import '../../../data/card/animals_data_source.dart';
import '../../../data/card/country_flags_data_source.dart';
import '../../../data/card/kids_activities_data_source.dart';
import '../../../data/card/musical_instruments_data_source.dart';
import '../../../infrastructure/card/card_data_source.dart';

class CardTypeMenuItem {
  final String name;
  final String image;
  final CardDataSource cardDataSource;

  const CardTypeMenuItem({
    required this.name,
    required this.image,
    required this.cardDataSource,
  });
}

class CardTypeMenu {
  const CardTypeMenu();

  KtList<CardTypeMenuItem> list() {
    const imagePath = 'assets/images/cards_types';

    return KtList.of(
      CardTypeMenuItem(
        name: 'Brincadeiras de criança',
        image: '$imagePath/kids_activities.png',
        cardDataSource: KidsActivitiesDataSource(),
      ),
      CardTypeMenuItem(
        name: 'Animais',
        image: '$imagePath/animals.png',
        cardDataSource: AnimalsDataSource(),
      ),
      CardTypeMenuItem(
        name: 'Bandeiras de países',
        image: '$imagePath/country_flags.png',
        cardDataSource: CountryFlagsDataSource(),
      ),
      CardTypeMenuItem(
        name: 'Instrumentos musicais',
        image: '$imagePath/music_instruments.png',
        cardDataSource: MusicalInstrumentsDataSource(),
      ),
    );
  }
}
