import 'package:flutter_memory_game_app/application/card/card_state.dart';
import 'package:flutter_memory_game_app/application/card/card_store.dart';
import 'package:flutter_memory_game_app/domain/card/card.dart';
import 'package:flutter_memory_game_app/domain/card/i_card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

import '../../mock_data/kids_activities_data_id_3_reveal_mocked.dart';
import '../../mock_data/kids_activities_data_ids_3_7_matched.dart';

class MockCardRepository extends Mock implements ICardRepository {}

void main() {
  late MockCardRepository mockCardRepository;
  late CardStore cardStore;
  late KtList<Card> cardsId3RevealMocked;
  late KtList<Card> cardsIds3and7MatchedMocked;
  late int firstCardIdRevealed;
  late int secondCardIdToReveal;

  setUpAll(() {
    mockCardRepository = MockCardRepository();
    cardStore = CardStore(cardRepository: mockCardRepository);
    firstCardIdRevealed = 3;
    secondCardIdToReveal = 7;
    cardsId3RevealMocked = mockKidsActivitiesId3Reveal();
    cardsIds3and7MatchedMocked = mockKidsActivitiesIds3and7Matched();
    cardStore.update(
      CardState(
        cards: cardsId3RevealMocked,
        cardRevealed: 3,
        lockRevealCard: false,
      ),
    );
    setUpMockCompareId3And7MatchedCardsRepository(
      mockCardRepository,
      cardsId3RevealMocked,
      firstCardIdRevealed,
      secondCardIdToReveal,
      cardsIds3and7MatchedMocked,
    );
  });

  storeTest<CardStore>(
    'Should cards 3 and 7 has matched',
    build: () => cardStore,
    act: (store) => store.compareCardsRevealed(secondCardIdToReveal),
    verify: (_) {
      verify(
        () => mockCardRepository.compareCardsRevealed(
          cards: cardsId3RevealMocked,
          firstCardId: firstCardIdRevealed,
          secondCardId: secondCardIdToReveal,
        ),
      ).called(1);
    },
    expect: () => [
      CardState(
        cards: cardsId3RevealMocked,
        cardRevealed: firstCardIdRevealed,
        lockRevealCard: false,
      ),
      tripleLoading,
      CardState(
        cards: cardsIds3and7MatchedMocked,
        cardRevealed: 0,
        lockRevealCard: false,
      ),
    ],
  );
}

void setUpMockCompareId3And7MatchedCardsRepository(
  MockCardRepository mockCardRepository,
  KtList<Card> cardsId3RevealMocked,
  int firstCardIdRevealed,
  int secondCardIdToReveal,
  KtList<Card> cardsIds3and7MatchedMocked,
) {
  when(
    () => mockCardRepository.compareCardsRevealed(
      cards: cardsId3RevealMocked,
      firstCardId: firstCardIdRevealed,
      secondCardId: secondCardIdToReveal,
    ),
  ).thenReturn(cardsIds3and7MatchedMocked);
}
