import 'package:flutter_memory_game_app/application/card/card_store.dart';
import 'package:flutter_memory_game_app/domain/card/card.dart';
import 'package:flutter_memory_game_app/infrastructure/card/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

import '../../mock_data/kids_activities_data_mocked.dart';

class MockCardRepository extends Mock implements CardRepository {}

void main() {
  late MockCardRepository mockCardRepository;
  late KtList<Card> initCardsMocked;

  setUpAll(() {
    mockCardRepository = MockCardRepository();
    initCardsMocked = mockKidsActivitiesInitGame();
    setUpMockCardsRepository(mockCardRepository, initCardsMocked);
  });

  storeTest<CardStore>(
    'Should init game',
    build: () => CardStore(cardRepository: mockCardRepository),
    act: (store) => store.initGame(),
    expect: () => [
      const KtList.empty(),
      tripleLoading,
      initCardsMocked,
    ],
  );
}

void setUpMockCardsRepository(MockCardRepository mockCardRepository, KtList<Card> cardsMocked) {
  when(mockCardRepository.initGame).thenReturn(cardsMocked);
}
