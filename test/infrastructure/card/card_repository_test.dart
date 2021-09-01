import 'package:flutter_memory_game_app/data/card/kids_activities_data_source.dart';
import 'package:flutter_memory_game_app/domain/card/card.dart';
import 'package:flutter_memory_game_app/infrastructure/card/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';

import '../../mock_data/kids_activities_data_id_3_reveal_mocked.dart';
import '../../mock_data/kids_activities_data_ids_3_7_matched.dart';
import '../../mock_data/kids_activities_data_mocked.dart';

void main() {
  late KidsActivitiesDataSource kidsActivitiesDataSouce;
  late CardRepository cardRepository;

  setUpAll(() {
    kidsActivitiesDataSouce = KidsActivitiesDataSource();
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
      final KtList<Card> initCardsMocked = mockKidsActivitiesInitGame();
      late KtList<Card> revealCardId3;

      void setUpCardId3Reveal() {
        revealCardId3 = cardRepository.revealCard(
          cards: initCardsMocked,
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

  group('Hide card | ', () {
    final KtList<Card> cardsId3RevealMocked = mockKidsActivitiesId3Reveal();
    late KtList<Card> hideCardId3;

    void setUpCardId3Hide() {
      hideCardId3 = cardRepository.hideCard(
        cards: cardsId3RevealMocked,
        cardId: 3,
      );
    }

    test(
      'Should hide card id 3',
      () {
        setUpCardId3Hide();
        final cardId3 = hideCardId3.asList().elementAt(2);
        expect(cardId3.isMatched, isFalse);
      },
    );

    test('Should check if all cards is hidden', () {
      setUpCardId3Hide();
      bool isAllCardsHidden = true;
      hideCardId3.asList().forEach((card) {
        if (card.isMatched) {
          isAllCardsHidden = false;
        }
      });
      expect(isAllCardsHidden, isTrue);
    });
  });

  group(
    'Compare cards revealed | ',
    () {
      final KtList<Card> initCardsMocked = mockKidsActivitiesInitGame();
      final KtList<Card> cardsId3RevealMocked = mockKidsActivitiesId3Reveal();
      final KtList<Card> cardsIds3and7MatchedMocked = mockKidsActivitiesIds3and7Matched();
      const firstCardId = 3;

      test(
        'Should cards 3 and 7 has match',
        () {
          const secondCardId = 7;
          final cards = cardRepository.compareCardsRevealed(
            cards: cardsId3RevealMocked,
            firstCardId: firstCardId,
            secondCardId: secondCardId,
          );
          expect(cards, cardsIds3and7MatchedMocked);
        },
      );

      test(
        'Should cards 3 and 8 has not match',
        () {
          const secondCardId = 8;
          final cards = cardRepository.compareCardsRevealed(
            cards: cardsId3RevealMocked,
            firstCardId: firstCardId,
            secondCardId: secondCardId,
          );
          expect(cards, initCardsMocked);
        },
      );
    },
  );
}
