import 'package:flutter_memory_game_app/application/card/card_state.dart';
import 'package:flutter_memory_game_app/application/card/card_store.dart';
import 'package:flutter_memory_game_app/domain/card/card.dart';
import 'package:flutter_memory_game_app/domain/card/i_card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

import '../../mock_data/kids_activities_data_id_3_reveal_mocked.dart';
import '../../mock_data/kids_activities_data_mocked.dart';

class MockCardRepository extends Mock implements ICardRepository {}

void main() {
  late MockCardRepository mockCardRepository;
  late CardStore cardStore;
  late KtList<Card> initCardsMocked;
  late KtList<Card> cardsId3RevealMocked;
  late int firstCardIdRevealed;
  late int secondCardIdToReveal;

  setUpAll(() {
    mockCardRepository = MockCardRepository();
    cardStore = CardStore(cardRepository: mockCardRepository);
    firstCardIdRevealed = 3;
    secondCardIdToReveal = 8;
    initCardsMocked = mockKidsActivitiesInitGame();
    cardsId3RevealMocked = mockKidsActivitiesId3Reveal();
    cardStore.update(
      CardState(
        cards: cardsId3RevealMocked,
        cardRevealed: 3,
        lockRevealCard: false,
      ),
    );
    setUpMockCompareId3And8NotMatchedCardsRepository(
      mockCardRepository,
      cardsId3RevealMocked,
      firstCardIdRevealed,
      secondCardIdToReveal,
      initCardsMocked,
    );
  });

  storeTest<CardStore>(
    'Should cards 3 and 8 has not matched (cards should return to initial state)',
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
        cards: initCardsMocked,
        cardRevealed: 0,
        lockRevealCard: false,
      ),
    ],
  );
}

void setUpMockCompareId3And8NotMatchedCardsRepository(
  MockCardRepository mockCardRepository,
  KtList<Card> cardsId3RevealMocked,
  int firstCardIdRevealed,
  int secondCardIdToReveal,
  KtList<Card> initCardsMocked,
) {
  when(
    () => mockCardRepository.compareCardsRevealed(
      cards: cardsId3RevealMocked,
      firstCardId: firstCardIdRevealed,
      secondCardId: secondCardIdToReveal,
    ),
  ).thenReturn(initCardsMocked);
}
