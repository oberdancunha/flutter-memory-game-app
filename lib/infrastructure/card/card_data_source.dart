import 'card_dto.dart';

abstract class CardDataSource {
  List<CardDto> create();
}
