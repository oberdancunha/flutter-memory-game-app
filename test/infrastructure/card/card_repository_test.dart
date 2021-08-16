import 'package:flutter_memory_game_app/data/card/kids_activities_data_source.dart';
import 'package:flutter_memory_game_app/infrastructure/card/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late KidsActivitiesDataSouce kidsActivitiesDataSouce;
  late CardRepository cardRepository;

  setUpAll(() {
    kidsActivitiesDataSouce = KidsActivitiesDataSouce();
    cardRepository = CardRepository(cardDataSource: kidsActivitiesDataSouce);
  });

  test(
    'Should return 20 cards to game',
    () {
      final cards = cardRepository.initGame();
      expect(cards.size, equals(20));
    },
  );

  test(
    "Should verify if there are two copies of each card",
    () {
      final cards = cardRepository.initGame();
      final verifyCardsName = <String, int>{};
      bool isNameTwoCopies = true;

      cards.asList().forEach(
        (card) {
          verifyCardsName[card.name] =
              verifyCardsName[card.name] == null ? 1 : verifyCardsName[card.name]! + 1;
        },
      );

      verifyCardsName.keys.forEach(
        (cardName) {
          if (verifyCardsName[cardName] != 2) {
            isNameTwoCopies = false;
          }
        },
      );

      expect(verifyCardsName.length, equals(10));
      expect(isNameTwoCopies, isTrue);
    },
  );
}
