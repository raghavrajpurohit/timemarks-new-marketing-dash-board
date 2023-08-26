import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/my_flutter_app_icons.dart';
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

Widget myDrawerHeaderHirringFormsApplications(context) {
  return Container(
    alignment: Alignment.topLeft,
    height: 125,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: MyColor.borderColor),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  MyFlutterApp.briefcase_search_outline,
                  color: MyColor.greyWidgetColor.withOpacity(0.3),
                  size: 35,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: MyColor.isVerifiedColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3, bottom: 3),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: MyTextWidget(
                                      content: "e-Mitra",
                                      myColor: MyColor.whiteTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "e-Mitra hiring application ",
                            style: TextStyle(
                                color: MyColor.blackText,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
