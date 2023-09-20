import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/my_flutter_app_icons.dart';
import 'package:new_marketing_dash_board/constants/responsive.dart';
import 'package:new_marketing_dash_board/data/network_helper/html_js.dart';
import 'package:new_marketing_dash_board/presentation/screens/hirring/hirring.dart';
import 'package:new_marketing_dash_board/presentation/widgets/drawerHeader.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';

class AddChannel extends StatefulWidget {
  static const String pageId = "/addchannel";
  const AddChannel({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<AddChannel> createState() => _AddChannelState();
}

class _AddChannelState extends State<AddChannel> {
  String? category;

  final bool _includeBaseDestinationsInMenu = false;
  final bool _fabInRail = true;
  late int _selectedIndex;
  List<Widget> allPages = [
    const AddNewChannel(),
    const HirringScreen(),
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
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextWidget(
                content: "New Channel",
                myColor: MyColor.blackText,
                fontSize: 20,
                fontbold: FontWeight.bold,
              ),
              SizedBox(
                height: 40,
                width: 134,
                child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff262338))),
                    onPressed: () {},
                    child: MyTextWidget(
                      content: "Create",
                      myColor: MyColor.whiteContainer,
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            // spacing: 25,
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Card(
                    elevation: 2,
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage("https://picsum.photos/200/300"),
                            ),
                            MyTextWidget(
                              content: "Upload",
                              myColor: MyColor.blueTextColor,
                            ),
                          ],
                        ),
                        const MyTextWidget(
                          textOverflow: TextOverflow.ellipsis,
                          content: "It’s recommended to ",
                        )
                      ],
                    ))),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: SizedBox(
                  width: double.infinity,
                  child: Card(
                      elevation: 2,
                      child: Container(,
                      
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              color: MyColor.blackText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                          children: const [
                                            TextSpan(text: "Channel Name "),
                                            TextSpan(
                                                text: " *",
                                                style: TextStyle(
                                                    color: Colors.red))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 3,
                                                    color: Colors.greenAccent),
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      )))),

        ],
      ),
    );
  }
}
