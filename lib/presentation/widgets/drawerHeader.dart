import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';

Widget myDrawerHeader(context) {
  return Container(
    alignment: Alignment.topLeft,
    height: 125,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/studyem.png",
            height: 60,
            width: 60,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: MyTextWidget(
              content: "MANAGER",
              myColor: MyColor.drawerTextColor,
              fontSize: 28,
              fontbold: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
  );
}
