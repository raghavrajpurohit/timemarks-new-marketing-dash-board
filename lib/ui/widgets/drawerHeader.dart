import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/ui/colors.dart';
import 'package:new_marketing_dash_board/ui/widgets/myTextWidget.dart';

Widget myDrawerHeader(BuildContext) {
  return Container(
    alignment: Alignment.topLeft,
    height: 125,
    width: MediaQuery.of(BuildContext).size.width,
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
