import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/responsive.dart';
import 'package:new_marketing_dash_board/ui/my_flutter_app_icons.dart';

import 'package:new_marketing_dash_board/ui/colors.dart';
import 'package:new_marketing_dash_board/ui/widgets/drawerHeader.dart';

import '../ui/widgets/myTextWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String pageId = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _destinationCount = 7;
  final bool _includeBaseDestinationsInMenu = false;
  final bool _fabInRail = true;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      drawerTextColor: MyColor.whiteTextColor,
      drawerColor: MyColor.drawerColor,
      drawerHeader: myDrawerHeader(context),
      destinations: _allDestinations.sublist(0, _destinationCount),
      selectedIndex: 0,
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
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      fabInRail: _fabInRail,
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 8),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                  content: "Channel",
                  myColor: MyColor.blackText,
                  fontSize: 20,
                  fontbold: FontWeight.bold,
                ),
                Container(
                  height: 35,
                  width: ResponsiveD.d(context) == ResponsiveD.mobile
                      ? 200
                      : ResponsiveD.d(context) == ResponsiveD.tablet
                          ? 250
                          : 300,
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
              ],
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                    color: MyColor.whiteContainer,
                    border: Border.all(color: MyColor.borderColor),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: MyColor.borderColor),
                                borderRadius: BorderRadius.circular(8))),
                      )
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            showCheckboxColumn: true,
                            columns: [
                              DataColumn(
                                  label: MyTextWidget(
                                      content: "NAME",
                                      myColor: MyColor.greyText,
                                      fontbold: FontWeight.bold)),
                              DataColumn(
                                  label: MyTextWidget(
                                      content: "VERIFICATION",
                                      myColor: MyColor.greyText,
                                      fontbold: FontWeight.bold)),
                              DataColumn(
                                  label: MyTextWidget(
                                      content: "TOTAL MEMBERS",
                                      myColor: MyColor.greyText,
                                      fontbold: FontWeight.bold)),
                              DataColumn(
                                  label: MyTextWidget(
                                      content: "INSTALLED PLUGIN",
                                      myColor: MyColor.greyText,
                                      fontbold: FontWeight.bold)),
                              DataColumn(
                                  label: MyTextWidget(
                                      content: "ADMIN",
                                      myColor: MyColor.greyText,
                                      fontbold: FontWeight.bold)),
                              DataColumn(
                                  label: MyTextWidget(
                                content: "TYPE",
                                myColor: MyColor.greyText,
                                fontbold: FontWeight.bold,
                              )),
                            ],
                            rows: [
                              for (Map m in tabelList)
                                DataRow(cells: [
                                  DataCell(Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            NetworkImage(m["logo"]),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      MyTextWidget(
                                        content: m["name"],
                                        myColor: MyColor.blackText,
                                        fontbold: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ],
                                  )),
                                  DataCell(
                                    m["isVerified"]
                                        ? Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black12,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xff27AE60)
                                                    .withOpacity(0.1)),
                                            child: MyTextWidget(
                                              content: "Verified",
                                              myColor: const Color(0xff27AE60),
                                            ),
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black12,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xffA0A3BD)
                                                    .withOpacity(0.1)),
                                            child: MyTextWidget(
                                                content: "Unverified",
                                                myColor:
                                                    const Color(0xffA0A3BD)),
                                          ),
                                  ),
                                  DataCell(
                                    MyTextWidget(
                                      content: m["totalMembers"],
                                      myColor: MyColor.blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                  DataCell(
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MyTextWidget(
                                          content: m["intalledPlugin"],
                                          myColor: MyColor.blackText,
                                          fontSize: 14,
                                        ),
                                        MyTextWidget(
                                          content:
                                              "+${m["morePlugin"].toString()} more",
                                          myColor: MyColor.greyText,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataCell(
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MyTextWidget(
                                          content: m["admin"],
                                          myColor: MyColor.blackText,
                                          fontSize: 14,
                                        ),
                                        MyTextWidget(
                                          content:
                                              "+${m["moreAdmin"].toString()} more",
                                          myColor: MyColor.greyText,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataCell(
                                    MyTextWidget(
                                      content: m["type"],
                                      myColor: MyColor.blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ])
                            ],
                          )))
                ]),
              ))
        ]));
  }
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

List<Map<String, dynamic>> tabelList = [
  {
    "name": "Sarkari Job",
    "isVerified": true,
    "logo": "https://picsum.photos/210/300",
    "totalMembers": "5,00,000",
    "intalledPlugin": "e-Mitra & CSC",
    "morePlugin": 5,
    "admin": "Harphool",
    "moreAdmin": 3,
    "type": "Public"
  },
  {
    "name": "Jigyasa Institute",
    "isVerified": false,
    "logo": "https://picsum.photos/220/300",
    "totalMembers": "90,000",
    "intalledPlugin": "Doctor",
    "morePlugin": 1,
    "admin": "Ranu Meena",
    "moreAdmin": 2,
    "type": "Public"
  },
  {
    "name": "Agriculture Education Hub",
    "isVerified": true,
    "logo": "https://picsum.photos/240/300",
    "totalMembers": "90,500",
    "intalledPlugin": "Promotion",
    "morePlugin": 4,
    "admin": "Lokesh",
    "moreAdmin": 5,
    "type": "Private"
  },
  {
    "name": "e-Mitra",
    "isVerified": true,
    "logo": "https://picsum.photos/250/300",
    "totalMembers": "5,000",
    "intalledPlugin": "Doctor",
    "morePlugin": 5,
    "admin": "Satish Sir",
    "moreAdmin": 2,
    "type": "Public"
  },
];
