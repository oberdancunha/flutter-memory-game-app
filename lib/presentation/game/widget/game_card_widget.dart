import 'package:flutter/material.dart';

import '../../../application/card/card_store.dart';

class GameCardWidget extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final bool isMatched;
  final CardStore cardStore;

  const GameCardWidget({
    required this.id,
    required this.name,
    required this.image,
    required this.isMatched,
    required this.cardStore,
    Key? key,
  }) : super(key: key);

  @override
  _GameCardWidgetState createState() => _GameCardWidgetState();
}

class _GameCardWidgetState extends State<GameCardWidget> {
  late bool revealThisCard;

  @override
  void initState() {
    super.initState();
    revealThisCard = false;
  }

  @override
  Widget build(BuildContext context) {
    final isRevealCard = widget.isMatched || revealThisCard;
    final revealCardCurrentPlay =
        widget.cardStore.state.cardRevealed == widget.id || revealThisCard;

    return GestureDetector(
      onTap: () {
        if (!widget.cardStore.state.lockRevealCard! && !widget.isMatched) {
          if (widget.cardStore.state.cardRevealed > 0) {
            setState(() {
              revealThisCard = true;
            });
            widget.cardStore.lockRevealCard();
            Future.delayed(const Duration(seconds: 1), () {
              widget.cardStore.compareCardsRevealed(widget.id);
              setState(() {
                revealThisCard = false;
              });
              widget.cardStore.unLockRevealCard();
            });
          } else {
            widget.cardStore.revealCard(widget.id);
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 6,
        color: !isRevealCard
            ? Colors.brown
            : revealCardCurrentPlay
                ? Colors.amber.shade900
                : Colors.green.shade700,
        child: isRevealCard
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    widget.image,
                    scale: 0.8,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Image.asset(
                'assets/images/guess.png',
                scale: 0.9,
              ),
      ),
    );
  }
}
