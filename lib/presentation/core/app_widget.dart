import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Memory game',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Baloo2',
        ),
        initialRoute: '/',
      ).modular();
}
