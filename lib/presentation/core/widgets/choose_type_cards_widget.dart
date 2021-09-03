import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/card/card_store.dart';
import '../../../infrastructure/card/card_data_source.dart';
import '../misc/card_type_menu.dart';

class ChooseTypeCardsWidget extends StatelessWidget {
  const ChooseTypeCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardTypeMenuItems = const CardTypeMenu().list();

    return SizedBox(
      height: ScreenUtil().setHeight(120),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardTypeMenuItems.size,
        itemBuilder: (_, index) {
          final cardTypeMenuItem = cardTypeMenuItems.get(index);

          return _buildMenuItems(
            context: context,
            title: cardTypeMenuItem.name,
            image: cardTypeMenuItem.image,
            cardDataSource: cardTypeMenuItem.cardDataSource,
          );
        },
      ),
    );
  }

  Widget _buildMenuItems({
    required BuildContext context,
    required String title,
    required String image,
    required CardDataSource cardDataSource,
  }) =>
      GestureDetector(
        onTap: () {
          Modular.get<CardStore>().destroy();
          Modular.to.pushReplacementNamed(
            '/game',
            arguments: [
              title,
              cardDataSource,
            ],
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: Card(
            color: Colors.brown,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage(image),
                  width: ScreenUtil().setWidth(50),
                ),
                SizedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
