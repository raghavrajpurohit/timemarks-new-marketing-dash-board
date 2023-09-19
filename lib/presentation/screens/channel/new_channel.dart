import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/responsive.dart';
import 'package:new_marketing_dash_board/data/network_helper/html_js.dart';

import 'package:new_marketing_dash_board/presentation/screens/channel/channel.dart.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';
import 'package:new_marketing_dash_board/constants/my_flutter_app_icons.dart';

import 'package:new_marketing_dash_board/presentation/widgets/drawerHeader.dart';

class AddChannel extends StatefulWidget {
  static const String pageId = "/addchannel";
  const AddChannel({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<AddChannel> createState() => _AddChannelState();
}

class _AddChannelState extends State<AddChannel> {
  final bool _includeBaseDestinationsInMenu = false;
  final bool _fabInRail = true;
  late int _selectedIndex;
  List<Widget> allPages = [
    const AddNewChannel(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.initialIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      drawerTextColor: MyColor.whiteTextColor,
      drawerColor: MyColor.drawerColor,
      onDestinationSelected: (value) {
        _selectedIndex = value;
        WebNavigation.updateCurrentWebPathQueryParm(
          {"initialIndex": _selectedIndex.toString()},
        );
        setState(() {});
      },
      drawerHeader: myDrawerHeader(context),
      destinations: _allDestinations,
      selectedIndex: _selectedIndex,
      includeBaseDestinationsInMenu: _includeBaseDestinationsInMenu,
      selectedIndexIndicatorColor: Colors.white,
      appBar: AdaptiveAppBar(
        backgroundColor: MyColor.appBarColor,
        elevation: 10,
        title: !(ResponsiveD.d(context) == ResponsiveD.desktop)
            ? MyTextWidget(
                content: "STUDYEM",
                fontbold: FontWeight.bold,
                myColor: MyColor.drawerColor.withOpacity(0.7),
              )
            : null,
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

class AddNewChannel extends StatefulWidget {
  const AddNewChannel({super.key});

  @override
  State<AddNewChannel> createState() => _AddNewChannelState();
}

class _AddNewChannelState extends State<AddNewChannel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(color: MyColor.appBarColor),
    );
  }
}
