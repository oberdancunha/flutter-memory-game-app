import 'package:kt_dart/kt.dart';

import 'card.dart';

abstract class ICardRepository {
  KtList<Card> initGame();
}
