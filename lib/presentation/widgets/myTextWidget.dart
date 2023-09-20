import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String content;
  final Color myColor;
  final double? fontSize;
  final FontWeight? fontbold;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  const MyTextWidget(
      {super.key,
      required this.content,
      this.myColor = Colors.black,
      this.fontSize,
      this.textAlign,
      this.fontbold,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      style: TextStyle(
        color: myColor,
        fontSize: fontSize,
        fontWeight: fontbold,
        overflow: textOverflow
      ),
    );
  }
}
