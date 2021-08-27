import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:soundpool/soundpool.dart';

class GameFinishWidget extends StatefulWidget {
  const GameFinishWidget({Key? key}) : super(key: key);

  @override
  _GameFinishWidgetState createState() => _GameFinishWidgetState();
}

class _GameFinishWidgetState extends State<GameFinishWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Soundpool _pool;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _pool = Soundpool.fromOptions(
      options: const SoundpoolOptions(
        streamType: StreamType.notification,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pool.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Lottie.asset(
        'assets/lotties/game_finish.json',
        fit: BoxFit.cover,
        controller: _controller,
        onLoaded: (composition) async {
          await _playGameFinishAudio(composition.duration);
          _controller
            ..duration = composition.duration
            ..forward();
        },
      );

  Future<void> _playGameFinishAudio(Duration duration) async {
    final soundId = await rootBundle.load('assets/sounds/game_finish.mp3').then(_pool.load);
    final streamId = await _pool.play(soundId);
    _pool.setVolume(
      soundId: soundId,
      streamId: streamId,
      volume: 0.5,
    );
    Future.delayed(duration, () => _pool.stop(streamId));
  }
}
