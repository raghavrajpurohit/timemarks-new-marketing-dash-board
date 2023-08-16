// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  String content;
  Color myColor = Colors.black;
  double? fontSize;
  FontWeight? fontbold;
  MyTextWidget(
      {super.key,
      required this.content,
      required this.myColor,
      this.fontSize,
      this.fontbold});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style:
          TextStyle(color: myColor, fontSize: fontSize, fontWeight: fontbold),
    );
  }
}
