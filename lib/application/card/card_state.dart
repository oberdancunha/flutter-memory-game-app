import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/card/card.dart';

part 'card_state.freezed.dart';

@freezed
abstract class CardState with _$CardState {
  const factory CardState({
    required KtList<Card> cards,
    required int cardRevealed,
  }) = _CardState;

  factory CardState.initial() => const CardState(
        cards: KtList.empty(),
        cardRevealed: 0,
      );
}
