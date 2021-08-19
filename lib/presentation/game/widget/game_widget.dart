import 'package:flutter/material.dart' hide Card;
import 'package:flutter_triple/flutter_triple.dart';
import 'package:kt_dart/kt.dart';

import '../../../application/card/card_state.dart';
import '../../../application/card/card_store.dart';
import '../../../domain/card/card.dart';
import '../../../domain/core/failures.dart';
import 'game_card_widget.dart';

class GameWidget extends StatefulWidget {
  final String title;
  final CardStore cardStore;

  const GameWidget({
    required this.title,
    required this.cardStore,
    Key? key,
  }) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  @override
  void initState() {
    super.initState();
    widget.cardStore.initGame();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 5),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade700,
            ),
          ),
          ScopedBuilder<CardStore, Failure, CardState>(
            store: widget.cardStore,
            onLoading: (_) => const CircularProgressIndicator(),
            onState: (_, state) => _buildCards(state.cards, widget.cardStore),
          ),
        ],
      );

  Widget _buildCards(KtList<Card> cards, CardStore cardStore) => Center(
        child: GridView.count(
          crossAxisCount: 5,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: List.generate(
            cards.size,
            (index) => GameCardWidget(
              id: cards.elementAt(index).id,
              name: cards.elementAt(index).name,
              image: cards.elementAt(index).image,
              isMatched: cards.elementAt(index).isMatched,
              cardStore: cardStore,
            ),
          ),
        ),
      );
}
