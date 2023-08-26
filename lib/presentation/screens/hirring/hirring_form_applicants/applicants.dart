import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/responsive.dart';
import 'package:new_marketing_dash_board/presentation/screens/hirring/hirring_form_applicants/hirring_forms_applicants.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';

class HirringApplicants extends StatefulWidget {
  const HirringApplicants({super.key});

  @override
  State<HirringApplicants> createState() => _HirringApplicantsState();
}

class _HirringApplicantsState extends State<HirringApplicants> {
  @override
  Widget build(BuildContext context) {
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
                  content: "Forms Applicants",
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
                        hintText: "Search member",
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
                              borderRadius: BorderRadius.circular(8)),
                          child: ResponsiveD.d(context) == ResponsiveD.desktop
                              ? _upperRowWeb(context)
                              : mobileDropDown(),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        showCheckboxColumn: true,
                        columns: [
                          DataColumn(
                              label: MyTextWidget(
                                  content: "APPLICANT NAME",
                                  myColor: MyColor.greyText,
                                  fontbold: FontWeight.bold)),
                          DataColumn(
                              label: MyTextWidget(
                            content: "STATUS",
                            myColor: MyColor.greyText,
                            fontbold: FontWeight.bold,
                          )),
                          DataColumn(
                              label: MyTextWidget(
                            content: "APPLY DATE",
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
                                    backgroundImage: NetworkImage(m["logo"]),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    child: MyTextWidget(
                                      content: m["name"],
                                      myColor: MyColor.blackText,
                                      fontbold: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              )),
                              DataCell(
                                m["isActive"]
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
                                        child: const MyTextWidget(
                                          content: "Active",
                                          myColor: Color(0xff27AE60),
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
                                        child: const MyTextWidget(
                                            content: "Closed",
                                            myColor: Color(0xffA0A3BD)),
                                      ),
                              ),
                              DataCell(
                                MyTextWidget(
                                  content: m["category"],
                                  myColor: MyColor.greyText,
                                  fontSize: 14,
                                ),
                              ),
                            ])
                        ],
                      ),
                    ),
                  ))
                ]),
              ))
        ]));
  }
}

// mydialoge(context) {
//   return showDialog(builder: (context) {
//     return Container()
//   }, context: context);
// }

List<Map<String, dynamic>> tabelList = [
  {
    "name": "e-Mitra hiring application",
    "isActive": true,
    "category": "e-Mitra",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
    "logo": "https://picsum.photos/id/237/200/300"
  },
  {
    "name": "Doctors",
    "isActive": true,
    "category": "Doctor",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
    "logo": "https://picsum.photos/id/237/200/300"
  },
  {
    "name": "Website developers",
    "isActive": false,
    "category": "Developer",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
    "logo": "https://picsum.photos/id/237/200/300"
  },
  {
    "name": "Doubt solver hiring",
    "isActive": true,
    "category": "Teacher",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
    "logo": "https://picsum.photos/id/237/200/300"
  },
  {
    "name": "IIT JEE Maths Teachers ",
    "isActive": false,
    "category": "Teacher",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
    "logo": "https://picsum.photos/id/237/200/300"
  },
];

Widget mobileDropDown() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: MyColor.borderColor,
            ),
            borderRadius: BorderRadius.circular(22)),
        child: MenuAnchor(
          style: MenuStyle(
            // maximumSize: MaterialStateProperty.all(const Size(300, 400)),
            elevation: MaterialStateProperty.all(10),
          ),
          menuChildren: <Widget>[
            MenuItemButton(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.delete_outline_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Delete")
                ],
              ),
              onPressed: () {},
            ),
            MenuItemButton(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.verified_user_outlined,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Verify")
                ],
              ),
              onPressed: () {},
            )
          ],
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return TextButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                    ? const Padding(
                        padding: EdgeInsets.only(
                            left: 25, right: 25, top: 9, bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Bulk Action'),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 22,
                            )
                          ],
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 9, bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Bulk Action'),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 22,
                            )
                          ],
                        ),
                      ));
          },
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: MyColor.greyWidgetColor.withOpacity(0.20),
            border: Border.all(
              color: MyColor.borderColor,
            ),
            borderRadius: BorderRadius.circular(22)),
        child: MenuAnchor(
          style: MenuStyle(
            // maximumSize: MaterialStateProperty.all(const Size(300, 400)),
            elevation: MaterialStateProperty.all(10),
          ),
          menuChildren: <Widget>[
            SubmenuButton(
              menuChildren: [
                MenuItemButton(
                  child: const Text("Date- 1"),
                  onPressed: () {},
                ),
                MenuItemButton(
                  child: const Text("Date- 2"),
                  onPressed: () {},
                ),
              ],
              child: const Text("All Dates"),
            ),
            SubmenuButton(
              menuChildren: [
                MenuItemButton(
                  child: const Text("Status-1"),
                  onPressed: () {},
                ),
                MenuItemButton(
                  child: const Text("Status-2"),
                  onPressed: () {},
                ),
              ],
              child: const Text("All Status"),
            ),
          ],
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return TextButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 9, bottom: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('FILTER'),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 22,
                      )
                    ],
                  ),
                ));
          },
        ),
      )
    ]),
  );
}

Widget _upperRowWeb(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // FIRST
      Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: MyColor.borderColor,
              ),
              borderRadius: BorderRadius.circular(22)),
          child: MenuAnchor(
            style: MenuStyle(
              // maximumSize: MaterialStateProperty.all(const Size(300, 400)),
              elevation: MaterialStateProperty.all(10),
            ),
            menuChildren: <Widget>[
              MenuItemButton(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.delete_outline_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Delete")
                  ],
                ),
                onPressed: () {},
              ),
              MenuItemButton(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Verify")
                  ],
                ),
                onPressed: () {},
              )
            ],
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return TextButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 9, bottom: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Bulk Action'),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 22,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),

      // second
      Row(
        children: [
          //third
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColor.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(22)),
              child: MenuAnchor(
                style: MenuStyle(
                  // maximumSize: MaterialStateProperty.all(const Size(300, 400)),
                  elevation: MaterialStateProperty.all(10),
                ),
                menuChildren: <Widget>[
                  MenuItemButton(
                    child: const Text("Date- 1"),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    child: const Text("Date- 2"),
                    onPressed: () {},
                  )
                ],
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return TextButton(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 9, bottom: 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('All Dates'),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 22,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // fourth
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColor.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(22)),
              child: MenuAnchor(
                style: MenuStyle(
                  // maximumSize: MaterialStateProperty.all(const Size(300, 400)),
                  elevation: MaterialStateProperty.all(10),
                ),
                menuChildren: <Widget>[
                  MenuItemButton(
                    child: const Text("Status-1"),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    child: const Text("Status-2"),
                    onPressed: () {},
                  )
                ],
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return TextButton(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 9, bottom: 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('All Status'),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 22,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          //fivth
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
                decoration: BoxDecoration(
                    color: MyColor.greyWidgetColor.withOpacity(0.20),
                    border: Border.all(
                      color: MyColor.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(22)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 9, bottom: 9),
                  child: Center(
                    child: MyTextWidget(
                      content: "FILTER",
                      myColor: MyColor.blackText,
                    ),
                  ),
                )),
          ),
        ],
      )
    ],
  );
}
