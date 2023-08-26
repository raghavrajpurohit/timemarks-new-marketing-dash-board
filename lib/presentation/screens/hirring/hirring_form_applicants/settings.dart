import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/responsive.dart';
import 'package:new_marketing_dash_board/presentation/screens/hirring/hirring_form_applicants/hirring_forms_applicants.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';

class HirringSettings extends StatefulWidget {
  const HirringSettings({super.key});

  @override
  State<HirringSettings> createState() => _HirringSettingsState();
}

class _HirringSettingsState extends State<HirringSettings> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  String? category;
  Widget dropdownwidget() {
    return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(color: MyColor.borderColor),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: DropdownButtonFormField(
          items: const [
            DropdownMenuItem(
              value: "Cat1",
              child: MyTextWidget(content: "Cat1"),
            ),
            DropdownMenuItem(
              value: "Cat2",
              child: MyTextWidget(content: "Cat2"),
            ),
            DropdownMenuItem(
              value: "Cat3",
              child: MyTextWidget(content: "Cat3"),
            ),
            DropdownMenuItem(
              value: "Cat4",
              child: MyTextWidget(content: "Cat4"),
            ),
          ],
          value: category,
          decoration: InputDecoration(
            hintText: "Select Category",
            hintStyle: TextStyle(color: MyColor.greyText),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 15),
            border: InputBorder.none,
          ),
          onChanged: (newValue) {
            setState(() {
              category = newValue;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: 25,
            left: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 30 : 15,
            right: 30,
            bottom: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                content: "Form Settings",
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
          Padding(
            padding: EdgeInsets.only(
                top: 8,
                bottom: 8,
                right: ResponsiveD.d(context) == ResponsiveD.desktop
                    ? 300
                    : ResponsiveD.d(context) == ResponsiveD.tablet
                        ? 100
                        : 30),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // width:
                    //     ResponsiveD.d(context) == ResponsiveD.desktop ? 1000 : 700,
                    height: ResponsiveD.d(context) == ResponsiveD.desktop
                        ? 311.16
                        : 400,
                    width: ResponsiveD.d(context) == ResponsiveD.desktop
                        ? 764.577
                        : null,
                    decoration: BoxDecoration(
                        color: MyColor.whiteContainer,
                        border: Border.all(color: MyColor.borderColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 24,
                          top: 20,
                          right: ResponsiveD.d(context) == ResponsiveD.desktop
                              ? 97.68
                              : 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(spacing: 50, runSpacing: 10, children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: MyColor.blackText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      children: const [
                                        TextSpan(text: "Start Date"),
                                        TextSpan(
                                            text: " *",
                                            style: TextStyle(color: Colors.red))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  dateWidget(startDate, "Start Date", context),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: MyColor.blackText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      children: const [
                                        TextSpan(text: "End Date"),
                                        TextSpan(
                                            text: " *",
                                            style: TextStyle(color: Colors.red))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  dateWidget(
                                      endDate, "Select End Date", context),
                                ],
                              ),
                            ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: MyColor.blackText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    children: const [
                                      TextSpan(text: "Category"),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                dropdownwidget(),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: MyColor.blackText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    children: const [
                                      TextSpan(text: "Delete Form"),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                OutlinedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(90, 32)),
                                      side: MaterialStateProperty.all(
                                          const BorderSide(color: Colors.red)),
                                    ),
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          FilledButton(
            onPressed: () {},
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(155, 40)),
                backgroundColor: MaterialStateProperty.all(MyColor.blackText)),
            child: const Text("Save Changes"),
          )
        ]));
  }
}

List<Map<String, dynamic>> tabelList = [
  {
    "name": "e-Mitra hiring application",
    "isActive": true,
    "category": "e-Mitra",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
  },
  {
    "name": "Doctors",
    "isActive": true,
    "category": "Doctor",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
  },
  {
    "name": "Website developers",
    "isActive": false,
    "category": "Developer",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
  },
  {
    "name": "Doubt solver hiring",
    "isActive": true,
    "category": "Teacher",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
  },
  {
    "name": "IIT JEE Maths Teachers ",
    "isActive": false,
    "category": "Teacher",
    "totalApplicants": "5,00,000",
    "hired": 200000,
    "pending": 5,
    "rejected": 3,
  },
];

Widget dateWidget(controller, hintText, context) {
  return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(color: MyColor.borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 10),
            child: Icon(
              Icons.calendar_today_outlined,
              color: MyColor.greyText,
            ),
          ),
          const VerticalDivider(),
          Expanded(
              child: TextField(
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: MyColor.greyText),
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15)),
            controller: controller,
            readOnly: true,
            onTap: () async {
              DateTime? selected = (await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(
                  DateTime.now().year + 100,
                ),
              ));
              if (selected != null) {
                controller.text = DateFormat("dd-MM-yyyy").format(selected);
              }
            },
          )),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child:
                Icon(Icons.arrow_drop_down_outlined, color: MyColor.greyText),
          )
        ],
      ));
}

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
                  child: const Text("Open"),
                  onPressed: () {},
                ),
                MenuItemButton(
                  child: const Text("Closed"),
                  onPressed: () {},
                ),
              ],
              child: const Text("Form Status"),
            ),
            SubmenuButton(
              menuChildren: [
                MenuItemButton(
                  child: const Text("Categories 1"),
                  onPressed: () {},
                ),
                MenuItemButton(
                  child: const Text("Categories 2"),
                  onPressed: () {},
                ),
              ],
              child: const Text("All Categories"),
            ),
            SubmenuButton(
              menuChildren: [
                MenuItemButton(
                  child: const Text("Type-1"),
                  onPressed: () {},
                ),
                MenuItemButton(
                  child: const Text("Type-2 "),
                  onPressed: () {},
                ),
              ],
              child: const Text("All Applicants"),
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
                child: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                    ? const Padding(
                        padding: EdgeInsets.only(
                            left: 25, right: 25, top: 9, bottom: 9),
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
                      )
                    : const Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 9, bottom: 9),
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
      ),

      // second
      Row(
        children: [
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
                    child: const Text("Active"),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    child: const Text("Closed"),
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
                      child: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                          ? const Padding(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 9, bottom: 9),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Form Status'),
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
                                  Text('Form Status'),
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
          ),

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
                    child: const Text("Category 1"),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    child: const Text("Category- 2"),
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
                      child: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                          ? const Padding(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 9, bottom: 9),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('All Categories'),
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
                                  Text('All Categories'),
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
                    child: const Text("Item-1"),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    child: const Text("Item-2"),
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
                      child: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                          ? const Padding(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 9, bottom: 9),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('All Applicants'),
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
                                  Text('All Applicants'),
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
