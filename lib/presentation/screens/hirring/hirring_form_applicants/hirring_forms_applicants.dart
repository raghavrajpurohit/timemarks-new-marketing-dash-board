import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/responsive.dart';
import 'package:new_marketing_dash_board/data/network_helper/html_js.dart';

import 'package:new_marketing_dash_board/presentation/screens/channel.dart.dart';
import 'package:new_marketing_dash_board/presentation/screens/hirring/hirring.dart';
import 'package:new_marketing_dash_board/presentation/screens/hirring/hirring_form_applicants/applicants.dart';
import 'package:new_marketing_dash_board/presentation/screens/hirring/hirring_form_applicants/settings.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';
import 'package:new_marketing_dash_board/constants/my_flutter_app_icons.dart';

import 'package:new_marketing_dash_board/presentation/widgets/drawerHeader.dart';

class HirringFormApplicants extends StatefulWidget {
  static const String pageId = "/hirring";
  const HirringFormApplicants({super.key, this.initialIndex});
  final int? initialIndex;
  @override
  State<HirringFormApplicants> createState() => _HirringFormApplicantsState();
}

class _HirringFormApplicantsState extends State<HirringFormApplicants> {
  final bool _includeBaseDestinationsInMenu = false;
  final bool _fabInRail = true;
  int _selectedIndex = 1;
  List<Widget> allPages = [
    const HirringApplicants(),
    const HirringSettings(),
  ];
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      drawerWidth: 250,
      drawerTextColor: MyColor.blackText,
      drawerColor: MyColor.whiteContainer,
      onDestinationSelected: (value) {
        _selectedIndex = value;
        _selectedIndex = value;
        WebNavigation.updateCurrentWebPathQueryParm(
          {"initialIndex": _selectedIndex.toString()},
        );
        setState(() {});
      },
      drawerHeader: myDrawerHeaderHirringFormsApplications(context),
      destinations: _allDestinations,
      selectedIndex: _selectedIndex,
      selectedIndexIndicatorColor: Colors.black,
      includeBaseDestinationsInMenu: _includeBaseDestinationsInMenu,
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
  AdaptiveScaffoldDestination(
      title: "Applicants", icon: Icons.people_alt_outlined),
  AdaptiveScaffoldDestination(title: "Settings", icon: Icons.settings),
];
