import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/card/card.dart';
import '../../domain/card/i_card_repository.dart';
import '../../domain/core/failures.dart';
import 'card_data_source.dart';

class CardRepository implements ICardRepository {
  final CardDataSource cardDataSource;

  const CardRepository({
    required this.cardDataSource,
  });

  @override
  KtList<Card> initGame() {
    final cards = cardDataSource.create();
    final cardsToGame = <Card>[];
    final random = Random();
    int id = 1;
    while (cards.where((card) => card.selectedToGame < 2).isNotEmpty) {
      final cardChoosedIndex = cards.length == 1 ? 0 : 0 + random.nextInt((cards.length - 1) - 0);
      final card = cards.elementAt(cardChoosedIndex);
      if (card.selectedToGame < 2) {
        cards
          ..remove(card)
          ..add(
            card.copyWith(
              selectedToGame: card.selectedToGame + 1,
            ),
          );
        cardsToGame.add(
          Card(
            id: id,
            name: card.name,
            image: card.image,
            isMatched: false,
          ),
        );
        id++;
      } else {
        cards.remove(card);
      }
    }

    return cardsToGame.toImmutableList();
  }

  @override
  KtList<Card> revealCard({
    required KtList<Card> cards,
    required int cardId,
  }) =>
      cards.asList().map(
        (card) {
          if (card.id == cardId) {
            card = card.copyWith(
              isMatched: true,
            );
          }

          return card;
        },
      ).toImmutableList();

  @override
  KtList<Card> hideCard({
    required KtList<Card> cards,
    required int cardId,
  }) =>
      cards.asList().map(
        (card) {
          if (card.id == cardId) {
            card = card.copyWith(
              isMatched: false,
            );
          }

          return card;
        },
      ).toImmutableList();

  @override
  Either<Failure, KtList<Card>> compareCardsRevealed({
    required KtList<Card> cards,
    required int firstCardId,
    required int secondCardId,
  }) {
    final firstCardName = cards.asList().where((card) => card.id == firstCardId).first.name;
    final secondCardName = cards.asList().where((card) => card.id == secondCardId).first.name;
    late KtList<Card> cardsCompared;
    if (firstCardName == secondCardName) {
      cardsCompared = revealCard(cards: cards, cardId: secondCardId);

      return right(cardsCompared);
    } else {
      cardsCompared = hideCard(cards: cards, cardId: firstCardId);

      return left(Failure.cardsNotMatched(cardsCompared));
    }
  }
}
