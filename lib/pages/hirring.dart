import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/responsive.dart';

import 'package:new_marketing_dash_board/ui/colors.dart';

import '../ui/widgets/myTextWidget.dart';

class HirringScreen extends StatefulWidget {
  const HirringScreen({super.key});

  @override
  State<HirringScreen> createState() => _HirringScreenState();
}

class _HirringScreenState extends State<HirringScreen> {
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
                  content: "Hirring",
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
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButtonFormField(
                            items: [
                              for (String m in filterDropdownItems)
                                DropdownMenuItem(
                                  child: Text(m),
                                )
                            ],
                            onChanged: (value) {
                              setState(() {
                                value;
                              });
                            },
                            value: filterDropdownItems[0],
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
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
                                      backgroundImage: NetworkImage(m["logo"]),
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
                                              myColor: const Color(0xffA0A3BD)),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                        )),
                  ))
                ]),
              ))
        ]));
  }
}

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

List filterDropdownItems = [
  "Filter",
  "Verified",
  "All Types",
  "Highest Members"
];

Widget filterDropDown() {
  return DropdownButtonFormField(
    items: [
      for (String m in filterDropdownItems)
        DropdownMenuItem(
          child: Text(m),
        )
    ],
    onChanged: (value) {},
    value: filterDropdownItems[0],
  );
}
