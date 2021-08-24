import 'dart:math';

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
  late bool _revealedCard;

  @override
  void initState() {
    super.initState();
    _revealedCard = false;
  }

  @override
  GestureDetector build(BuildContext context) {
    final shouldLetCardRevealed = widget.isMatched || _revealedCard;
    final revealCardCurrentPlay = widget.cardStore.state.cardRevealed == widget.id || _revealedCard;

    return GestureDetector(
      onTap: () {
        if (!widget.cardStore.state.lockRevealCard! && !widget.isMatched) {
          if (widget.cardStore.state.cardRevealed > 0) {
            _revealCard();
            _waitToCardsCompare();
            widget.cardStore.lockCardReveal();
          } else {
            widget.cardStore.revealCard(widget.id);
          }
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (widget, animation) => _revealedCardTransition(
          widget,
          animation,
          revealCardCurrentPlay,
        ),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: Container(
          key: ValueKey(revealCardCurrentPlay),
          width: MediaQuery.of(context).size.width / 5,
          color: !shouldLetCardRevealed
              ? Colors.brown
              : revealCardCurrentPlay
                  ? Colors.amber.shade900
                  : Colors.green.shade700,
          child: shouldLetCardRevealed
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      widget.image,
                      scale: 0.8,
                      width: MediaQuery.of(context).size.width / 12,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 37,
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
      ),
    );
  }

  void _revealCard() {
    setState(() {
      _revealedCard = true;
    });
  }

  void _hideCard() {
    setState(() {
      _revealedCard = false;
    });
  }

  void _waitToCardsCompare() {
    Future.delayed(const Duration(seconds: 1), () {
      widget.cardStore.compareCardsRevealed(widget.id);
      _hideCard();
      widget.cardStore.unlockCardReveal();
    });
  }

  AnimatedBuilder _revealedCardTransition(
    Widget widget,
    Animation<double> animation,
    bool revealCardCurrentPlay,
  ) {
    final animationRotate = Tween<double>(
      begin: pi,
      end: 0,
    ).animate(animation);

    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        final isUnder = ValueKey(revealCardCurrentPlay) == widget.key;
        final tilt = _calculateTilt(animation.value, isUnder);
        final radians = isUnder ? min(animationRotate.value, pi / 2) : animationRotate.value;

        return Transform(
          transform: revealCardCurrentPlay
              ? _revealCardRotate(radians, tilt)
              : _hideOrMatchCardRotate(radians, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
      child: widget,
    );
  }

  double _calculateTilt(double animationValue, bool isUnder) {
    var tilt = ((animationValue - 0.5).abs() - 0.5) * 0.003;

    return tilt *= isUnder ? -1.0 : 1.0;
  }

  Matrix4 _revealCardRotate(double radians, double tilt) =>
      Matrix4.rotationY(radians)..setEntry(3, 0, tilt);

  Matrix4 _hideOrMatchCardRotate(double radians, double tilt) =>
      Matrix4.rotationX(radians)..setEntry(3, 1, tilt);
}
