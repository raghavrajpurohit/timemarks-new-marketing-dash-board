import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/colors.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String pageId = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child:
                Container(decoration: BoxDecoration(color: drawerBackground))),
        Expanded(
          flex: 4,
          child: Container(decoration: BoxDecoration(color: Colors.orange)),
        )
      ],
    );
  }
}
