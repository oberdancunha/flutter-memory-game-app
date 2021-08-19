import 'package:fpdart/fpdart.dart';
import 'package:kt_dart/kt.dart';

import '../core/failures.dart';
import 'card.dart';

abstract class ICardRepository {
  KtList<Card> initGame();
  KtList<Card> revealCard({
    required KtList<Card> cards,
    required int cardId,
  });
  KtList<Card> hideCard({
    required KtList<Card> cards,
    required int cardId,
  });
  Either<Failure, KtList<Card>> compareCardsRevealed({
    required KtList<Card> cards,
    required int firstCardId,
    required int secondCardId,
  });
}
