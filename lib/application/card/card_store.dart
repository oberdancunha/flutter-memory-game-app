import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/card/i_card_repository.dart';
import '../../domain/core/failures.dart';
import 'card_state.dart';

class CardStore extends StreamStore<Failure, CardState> {
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

  void compareCardsRevealed(int cardId) {
    setLoading(true);
    cardRepository
        .compareCardsRevealed(
      cards: state.cards,
      firstCardId: state.cardRevealed,
      secondCardId: cardId,
    )
        .fold(
      (failure) {
        failure.map(
          cardsNotMatched: (cardsNotMatched) => update(
            state.copyWith(
              cards: cardsNotMatched.cards,
            ),
          ),
        );
        setError(failure);
      },
      (cards) => update(
        state.copyWith(cards: cards),
      ),
    );
    update(
      state.copyWith(cardRevealed: 0),
    );
    setLoading(false);
  }

  void lockCardReveal() {
    update(
      state.copyWith(
        lockRevealCard: true,
      ),
    );
  }

  void unlockCardReveal() {
    update(
      state.copyWith(
        lockRevealCard: false,
      ),
    );
  }
}
