import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: false,
        child: SizedBox(
          height: ScreenUtil().setHeight(120),
          width: double.infinity,
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
                  fontSize: ScreenUtil().setSp(50),
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
