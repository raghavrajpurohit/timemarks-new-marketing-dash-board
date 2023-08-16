import 'dart:js';

import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/ui/my_flutter_app_icons.dart';

import 'package:new_marketing_dash_board/ui/colors.dart';
import 'package:new_marketing_dash_board/ui/widgets/drawerHeader.dart';
import 'package:new_marketing_dash_board/ui/widgets/myTextWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String pageId = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _destinationCount = 7;
  final bool _includeBaseDestinationsInMenu = true;
  final bool _fabInRail = true;

  // bool _fabInRail = true;
  // bool _includeBaseDestinationsInMenu = true;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      drawerTextColor: MyColor.drawerTextColor,
      drawerColor: MyColor.drawerColor,
      drawerHeader: myDrawerHeader(context),
      destinations: _allDestinations.sublist(0, _destinationCount),
      selectedIndex: 0,
      includeBaseDestinationsInMenu: _includeBaseDestinationsInMenu,
      appBar: AdaptiveAppBar(
        backgroundColor: MyColor.appBarColor,
        elevation: 10,
      ),
      backgroundColor: MyColor.bodyColor,
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      fabInRail: _fabInRail,
    );
  }
}

Widget _body() {
  return Padding(
      padding: const EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 8),
      child: Container(
          // decoration: BoxDecoration(color: MyColor.drawerColor),
          child: Column(children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: MyTextWidget(
                  content: "Channel",
                  myColor: MyColor.blackText,
                  fontSize: 20,
                  fontbold: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Channel",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                  color: MyColor.appBarColor,
                  border: Border.all(color: MyColor.blackText),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [_UpperRow(context)]),
              ),
            ))
      ])));
}

Widget _UpperRow(context) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
              color: MyColor.drawerColor,
              border: Border.all(color: MyColor.blackText),
              borderRadius: BorderRadius.circular(15)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyTextWidget(
              content: "Bulk",
              myColor: MyColor.blackText,
            ),
            const Icon(Icons.arrow_drop_down)
          ]),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: MyColor.drawerColor,
              border: Border.all(color: MyColor.blackText),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: MyTextWidget(
              content: "Apply",
              myColor: MyColor.blackText,
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        flex: 3,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: MyColor.drawerColor,
              border: Border.all(color: MyColor.blackText),
              borderRadius: BorderRadius.circular(15)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyTextWidget(
              content: "Verfied",
              myColor: MyColor.blackText,
            ),
            const Icon(Icons.arrow_drop_down)
          ]),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 3,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: MyColor.drawerColor,
              border: Border.all(color: MyColor.blackText),
              borderRadius: BorderRadius.circular(15)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyTextWidget(
              content: "All Types",
              myColor: MyColor.blackText,
            ),
            const Icon(Icons.arrow_drop_down)
          ]),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 4,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: MyColor.drawerColor,
              border: Border.all(color: MyColor.blackText),
              borderRadius: BorderRadius.circular(15)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyTextWidget(
              content: "Highest Members",
              myColor: MyColor.blackText,
            ),
            const Icon(Icons.arrow_drop_down)
          ]),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              color: MyColor.drawerColor,
              border: Border.all(color: MyColor.blackText),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: MyTextWidget(
              content: "FILTER",
              myColor: MyColor.blackText,
            ),
          ),
        ),
      )
    ],
  );
}

const _allDestinations = [
  AdaptiveScaffoldDestination(title: "Channels", icon: MyFlutterApp.channel),
  AdaptiveScaffoldDestination(title: "Hirring", icon: MyFlutterApp.hirring),
  AdaptiveScaffoldDestination(title: "Clock", icon: Icons.share),
  AdaptiveScaffoldDestination(title: "Upload", icon: Icons.upload),
  AdaptiveScaffoldDestination(title: "Delete", icon: Icons.delete),
  AdaptiveScaffoldDestination(title: "Save", icon: Icons.save),
  AdaptiveScaffoldDestination(title: 'Group', icon: Icons.group),
  AdaptiveScaffoldDestination(title: 'Headset', icon: Icons.headset),
  AdaptiveScaffoldDestination(title: 'Info', icon: Icons.info),
];

Widget __upppperrow() {
  return Row(
    children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: MyColor.drawerColor,
                border: Border.all(color: MyColor.blackText),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 14, left: 20, right: 20, bottom: 14),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          value: "Bulk Action",
                          child: MyTextWidget(
                            content: "Bulk Action",
                            myColor: MyColor.blackText,
                          ),
                        ),
                      ],
                      isExpanded: true,
                      onChanged: (Object? value) {},
                    )
                    // MyTextWidget(
                    //   content: "Bulk Action",
                    //   myColor: MyColor.blackText,
                    //   fontSize: 20,
                    // ),
                    // const Icon(Icons.arrow_drop_down)
                  ]),
            ),
          ),
        ],
      ),
      const Row(
        children: [],
      )
    ],
  );
}
