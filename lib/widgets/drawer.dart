import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_marketing_dash_board/widgets/MytextWidget.dart';

import '../colors.dart';

class Mydrwawer extends StatefulWidget {
  const Mydrwawer({super.key});

  @override
  State<Mydrwawer> createState() => _MydrwawerState();
}

class _MydrwawerState extends State<Mydrwawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: drawerBackground,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/logo.svg",
              color: textColor,
            ),
            MyTextWidget(
              content: "Manager",
            )
          ],
        )
      ]),
    );
  }
}
