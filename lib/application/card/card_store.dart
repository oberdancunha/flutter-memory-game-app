import 'dart:ffi';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:kt_dart/collection.dart';

import '../../domain/card/card.dart';
import '../../domain/card/i_card_repository.dart';

class CardStore extends StreamStore<Void, KtList<Card>> {
  final ICardRepository cardRepository;

  CardStore({
    required this.cardRepository,
  }) : super(const KtList.empty());

  void initGame() {
    setLoading(true);
    final cards = cardRepository.initGame();
    update(cards);
    setLoading(false);
  }
}
