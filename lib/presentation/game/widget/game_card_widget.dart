import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final letsRevealCardInCurrentPlay =
        widget.cardStore.state.cardRevealed == widget.id || _revealedCard;
    final isSameCardTappedMoreThanOnce = widget.id == widget.cardStore.state.cardRevealed;

    return GestureDetector(
      onTap: () {
        if (!widget.cardStore.state.lockRevealCard! &&
            !widget.isMatched &&
            !isSameCardTappedMoreThanOnce) {
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
          letsRevealCardInCurrentPlay,
        ),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: Container(
          key: ValueKey(letsRevealCardInCurrentPlay),
          width: MediaQuery.of(context).size.width / 5,
          color: !shouldLetCardRevealed
              ? Colors.brown
              : letsRevealCardInCurrentPlay
                  ? Colors.amber.shade900
                  : Colors.green.shade700,
          child: shouldLetCardRevealed
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      widget.image,
                      scale: 0.7,
                      width: ScreenUtil().setWidth(30),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: ScreenUtil().setHeight(35),
                      ),
                      child: AutoSizeText(
                        widget.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(13),
                        ),
                        textAlign: TextAlign.center,
                        minFontSize: 10,
                        maxLines: 2,
                      ),
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
    bool letsRevealCardInCurrentPlay,
  ) {
    final animationRotate = Tween<double>(
      begin: pi,
      end: 0,
    ).animate(animation);

    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        final isUnder = ValueKey(letsRevealCardInCurrentPlay) == widget.key;
        final tilt = _calculateTilt(animation.value, isUnder);
        final radians = isUnder ? min(animationRotate.value, pi / 2) : animationRotate.value;

        return Transform(
          transform: letsRevealCardInCurrentPlay
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
