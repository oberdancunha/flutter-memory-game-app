import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_dto.freezed.dart';

@freezed
abstract class CardDto with _$CardDto {
  const CardDto._();

  factory CardDto({
    required String name,
    required String image,
    required int selectedToGame,
  }) = _CardDto;
}
