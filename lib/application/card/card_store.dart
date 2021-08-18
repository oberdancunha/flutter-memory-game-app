import 'dart:ffi';

import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/card/i_card_repository.dart';
import 'card_state.dart';

class CardStore extends StreamStore<Void, CardState> {
  final ICardRepository cardRepository;

  CardStore({
    required this.cardRepository,
  }) : super(CardState.initial());

  void initGame() {
    setLoading(true);
    final cards = cardRepository.initGame();
    update(
      state.copyWith(cards: cards),
    );
    setLoading(false);
  }

  void revealCard(int cardId) {
    setLoading(true);
    final cards = cardRepository.revealCard(
      cards: state.cards,
      cardId: cardId,
    );
    update(
      state.copyWith(
        cards: cards,
        cardRevealed: cardId,
      ),
    );
    setLoading(false);
  }
}
