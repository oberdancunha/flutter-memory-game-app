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
  late int cardIdToReveal;

  setUpAll(() {
    mockCardRepository = MockCardRepository();
    cardStore = CardStore(cardRepository: mockCardRepository);
    cardIdToReveal = 3;
    initCardsMocked = mockKidsActivitiesInitGame();
    cardsId3RevealMocked = mockKidsActivitiesId3Reveal();
    cardStore.update(
      CardState(
        cards: initCardsMocked,
        cardRevealed: 0,
        lockRevealCard: false,
      ),
    );
    setUpMockRevealCardRepository(
      mockCardRepository,
      initCardsMocked,
      cardIdToReveal,
      cardsId3RevealMocked,
    );
  });

  storeTest<CardStore>(
    'Should check if only card with id 3 is revealed',
    build: () => cardStore,
    act: (store) => store.revealCard(cardIdToReveal),
    verify: (_) {
      verify(
        () => mockCardRepository.revealCard(
          cards: initCardsMocked,
          cardId: cardIdToReveal,
        ),
      ).called(1);
    },
    expect: () => [
      CardState(
        cards: initCardsMocked,
        cardRevealed: 0,
        lockRevealCard: false,
      ),
      tripleLoading,
      CardState(
        cards: cardsId3RevealMocked,
        cardRevealed: cardIdToReveal,
        lockRevealCard: false,
      ),
    ],
  );
}

void setUpMockRevealCardRepository(
  MockCardRepository mockCardRepository,
  KtList<Card> initCardsMocked,
  int cardIdToReveal,
  KtList<Card> cardsMocked,
) {
  when(
    () => mockCardRepository.revealCard(
      cards: initCardsMocked,
      cardId: cardIdToReveal,
    ),
  ).thenReturn(cardsMocked);
}
