import 'package:flutter_modular/flutter_modular.dart';

import '../../application/card/card_store.dart';
import '../../data/card/kids_activities_data_source.dart';
import '../../domain/card/i_card_repository.dart';
import '../../infrastructure/card/card_data_source.dart';
import '../../infrastructure/card/card_repository.dart';
import 'game_page.dart';

class GameModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<CardDataSource>(
      (i) => i.args!.data != null ? i.args!.data[1] as CardDataSource : KidsActivitiesDataSouce(),
    ),
    Bind.factory<ICardRepository>(
      (i) => CardRepository(cardDataSource: i.get<CardDataSource>()),
    ),
    Bind.factory<CardStore>(
      (i) => CardStore(cardRepository: i.get<ICardRepository>()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, i) => GamePage(
        title: i.data[0].toString(),
        cardStore: Modular.get<CardStore>(),
      ),
    ),
  ];
}
