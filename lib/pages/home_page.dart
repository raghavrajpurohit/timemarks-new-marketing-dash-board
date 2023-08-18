import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/pages/Channel.dart.dart';
import 'package:new_marketing_dash_board/ui/my_flutter_app_icons.dart';

import 'package:new_marketing_dash_board/ui/colors.dart';
import 'package:new_marketing_dash_board/ui/widgets/drawerHeader.dart';

import '../ui/widgets/myTextWidget.dart';
import 'hirring.dart';

class HomeScreen extends StatefulWidget {
  static const String pageId = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool _includeBaseDestinationsInMenu = false;
  final bool _fabInRail = true;
  int _selectedIndex = 1;
  List<Widget> allPages = [
    const ChannelScreen(),
    const HirringScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      drawerTextColor: MyColor.whiteTextColor,
      drawerColor: MyColor.drawerColor,
      onDestinationSelected: (value) {
        _selectedIndex = value;
        setState(() {});
      },
      drawerHeader: myDrawerHeader(context),
      destinations: _allDestinations,
      selectedIndex: _selectedIndex,
      includeBaseDestinationsInMenu: _includeBaseDestinationsInMenu,
      appBar: AdaptiveAppBar(
        backgroundColor: MyColor.appBarColor,
        elevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextWidget(
                      content: "Satish Sir",
                      myColor: MyColor.blackText,
                    ),
                    MyTextWidget(
                      content: "9950495655",
                      myColor: MyColor.greyText,
                    )
                  ],
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage("https://picsum.photos/200/300"),
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: MyColor.bodyColor,
      body: allPages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      fabInRail: _fabInRail,
    );
  }
}

const _allDestinations = [
  AdaptiveScaffoldDestination(title: "Channels", icon: MyFlutterApp.channel),
  AdaptiveScaffoldDestination(title: "Hirring", icon: MyFlutterApp.hirring),
];
