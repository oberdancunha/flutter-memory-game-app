import 'dart:ffi';

import 'package:flutter/material.dart' hide Card;
import 'package:flutter_triple/flutter_triple.dart';
import 'package:kt_dart/kt.dart';

import '../../../application/card/card_store.dart';
import '../../../domain/card/card.dart';

class GamePage extends StatefulWidget {
  final String title;
  final CardStore cardStore;

  const GamePage({
    required this.title,
    required this.cardStore,
    Key? key,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
          ScopedBuilder<CardStore, Void, KtList<Card>>(
            store: widget.cardStore,
            onLoading: (_) => const CircularProgressIndicator(),
            onState: (_, cards) => _buildCards(cards),
          ),
        ],
      );

  Widget _buildCards(KtList<Card> cards) => Center(
        child: GridView.count(
          crossAxisCount: 5,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: List.generate(
            cards.size,
            (index) => _buildCard(
              name: cards.elementAt(index).name,
              image: cards.elementAt(index).image,
            ),
          ),
        ),
      );

  Widget _buildCard({
    required String name,
    required String image,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width / 6,
        color: Colors.brown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              scale: 0.9,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
