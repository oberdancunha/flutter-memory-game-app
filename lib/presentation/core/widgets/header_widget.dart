import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.transparent.withOpacity(0.3),
                      BlendMode.dstIn,
                    ),
                    image: const AssetImage('assets/images/memory_game_background.png'),
                  ),
                ),
              ),
              Text(
                'Jogo da Memória',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 7,
                  fontFamily: 'K26ToyBlocks123',
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
