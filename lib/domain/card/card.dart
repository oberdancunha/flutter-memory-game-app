import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';

@freezed
class Card with _$Card {
  const Card._();

  const factory Card({
    required int id,
    required String name,
    required String image,
    required bool isMatched,
  }) = _Card;
}
