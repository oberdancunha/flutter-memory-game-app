import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameFinishWidget extends StatefulWidget {
  const GameFinishWidget({Key? key}) : super(key: key);

  @override
  _GameFinishWidgetState createState() => _GameFinishWidgetState();
}

class _GameFinishWidgetState extends State<GameFinishWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Lottie.asset(
        'assets/lotties/game_finish.json',
        fit: BoxFit.cover,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward();
        },
      );
}
