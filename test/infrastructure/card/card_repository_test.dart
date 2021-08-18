import 'package:flutter_memory_game_app/data/card/kids_activities_data_source.dart';
import 'package:flutter_memory_game_app/domain/card/card.dart';
import 'package:flutter_memory_game_app/infrastructure/card/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';

void main() {
  late KidsActivitiesDataSouce kidsActivitiesDataSouce;
  late CardRepository cardRepository;

  setUpAll(() {
    kidsActivitiesDataSouce = KidsActivitiesDataSouce();
    cardRepository = CardRepository(cardDataSource: kidsActivitiesDataSouce);
  });

  group('Init game | ', () {
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
  });

  group(
    'Reveal card | ',
    () {
      late KtList<Card> cards;
      late KtList<Card> revealCardId3;

      void setUpCardId3Reveal() {
        cards = cardRepository.initGame();
        revealCardId3 = cardRepository.revealCard(
          cards: cards,
          cardId: 3,
        );
      }

      test(
        'Should reveal card id 3',
        () {
          setUpCardId3Reveal();
          final cardId3 = revealCardId3.asList().elementAt(2);
          expect(cardId3.isMatched, isTrue);
        },
      );

      test('Should check if only card with id 3 is revealed', () {
        setUpCardId3Reveal();
        bool isOnlyCardId3Revealed = true;
        revealCardId3.asList().forEach((card) {
          if (card.id != 3 && card.isMatched) {
            isOnlyCardId3Revealed = false;
          }
        });
        expect(isOnlyCardId3Revealed, isTrue);
      });
    },
  );
}
