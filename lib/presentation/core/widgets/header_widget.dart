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
          child: Image.asset('assets/images/memory_game_background.png'),
        ),
      );
}
