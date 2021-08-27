import 'dart:ffi';

import 'package:flutter/material.dart' hide Card;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:kt_dart/kt.dart';

import '../../../application/card/card_state.dart';
import '../../../application/card/card_store.dart';
import '../../../domain/card/card.dart';
import 'game_card_widget.dart';
import 'game_finish_widget.dart';

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
  Column build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(35),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                fontWeight: FontWeight.bold,
                color: Colors.brown.shade700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ScopedBuilder<CardStore, Void, CardState>(
              store: widget.cardStore,
              onLoading: (_) => const CircularProgressIndicator(),
              onState: (_, state) => Stack(
                alignment: Alignment.topCenter,
                children: [
                  _buildCards(context, state.cards, widget.cardStore),
                  if (_isGameFinish(state.cards)) const GameFinishWidget(),
                ],
              ),
            ),
          ),
        ],
      );

  GridView _buildCards(BuildContext context, KtList<Card> cards, CardStore cardStore) =>
      GridView.count(
        crossAxisCount: 5,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        childAspectRatio: MediaQuery.of(context).size.width > 600 ? 1.2 : 1.0,
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
      );

  bool _isGameFinish(KtList<Card> cards) {
    final listCardsMatchedFalse = cards.asList().where((card) => !card.isMatched);
    final isGameFinish = listCardsMatchedFalse.isEmpty;

    return isGameFinish;
  }
}
