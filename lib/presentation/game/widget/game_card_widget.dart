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
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => widget.cardStore.revealCard(widget.id),
        child: Container(
          width: MediaQuery.of(context).size.width / 6,
          color: Colors.brown,
          child: widget.isMatched
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
