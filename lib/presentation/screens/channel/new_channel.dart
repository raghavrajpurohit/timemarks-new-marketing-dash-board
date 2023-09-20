import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
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
  List<String> initialCatValue = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: !(ResponsiveD.d(context) == ResponsiveD.desktop)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.start,
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
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff262338))),
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
            Wrap(
              runAlignment: WrapAlignment.center,
              runSpacing: 20,
              spacing: ResponsiveD.d(context) == ResponsiveD.mobile
                  ? 50
                  : ResponsiveD.d(context) == ResponsiveD.tablet
                      ? 50
                      : 50,
              children: [
                // if (!(ResponsiveD.d(context) == ResponsiveD.mobile))
                profileContainer(context),
                formContainer(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget profileContainer(context) {
    var sizedBox = SizedBox(
        height: 312,
        width: 250,
        child: Card(
            elevation: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://picsum.photos/200/300"),
                      maxRadius: 60,
                      minRadius: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextWidget(
                      content: "UPLOAD",
                      myColor: MyColor.blueTextColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MyTextWidget(
                      content:
                          "Hi there please fill the form Hi there please fill the form Hi there please fill the form",
                      textAlign: TextAlign.center,
                    )
                  ]),
                ),
              ),
            )));
    return ResponsiveD.d(context) == ResponsiveD.desktop
        ? sizedBox
        : Row(
            children: [
              Expanded(child: sizedBox),
            ],
          );
  }

  Widget formContainer(context) {
    return SizedBox(
        height: !(ResponsiveD.d(context) == ResponsiveD.mobile)
            ? MediaQuery.of(context).size.height * 0.7
            : MediaQuery.of(context).size.height * 0.35,
        width: ResponsiveD.d(context) == ResponsiveD.desktop ? 800 : 750,
        child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(children: [
                    myForms("Phone Number", "Enter Phone Number"),
                    myForms("Unique Name", "Enter Unique Name"),
                    myForms("Channel Name", "Enter Channel Name"),
                    myForms("Channel Description", "Enter here...",
                        maxLines: 3),
                    const SizedBox(
                      height: 12,
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
                            children: [
                              TextSpan(
                                  text: "Channel Catagory",
                                  style: TextStyle(
                                      color: MyColor.blackText, fontSize: 14)),
                              const TextSpan(
                                  text: " *",
                                  style: TextStyle(color: Colors.red))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MultiSelectDialogField(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300)),
                          initialValue: initialCatValue,
                          items: [
                            for (String i in channelCategories)
                              MultiSelectItem(i, i),
                          ],
                          title: const Text("Select Category"),
                          selectedColor: Colors.blue,
                          buttonIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                          buttonText: const Text(
                            "Select Category",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          chipDisplay: MultiSelectChipDisplay(
                            onTap: (item) {
                              setState(() {
                                initialCatValue.remove(item);
                              });
                            },
                          ),
                          onConfirm: (results) {
                            initialCatValue = results as List<String>;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    myForms("Referal Mob.No.", "Mobile Number"),
                    myForms("Refferal Commision", "Commision"),
                  ]),
                ),
              ),
            )));
  }

// }

  Widget myForms(String title, String hintText, {int? maxLines}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(
          style: TextStyle(
              color: MyColor.blackText,
              fontWeight: FontWeight.bold,
              fontSize: 12),
          children: [
            TextSpan(
                text: title,
                style: TextStyle(color: MyColor.blackText, fontSize: 14)),
            const TextSpan(text: " *", style: TextStyle(color: Colors.red))
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD4D5D7),
                ),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD4D5D7),
                ),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD4D5D7),
                ),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD4D5D7),
                ),
                borderRadius: BorderRadius.circular(8)),
            label: Text(
              hintText,
              style: TextStyle(color: Colors.grey.shade500),
            )),
      ),
      const SizedBox(
        height: 12,
      )
    ]);
  }
}

List<String> channelCategories = [
  "Agriculture",
  "Govt Jobs",
  "NEET-IIT",
  "Livestock",
  "News and media",
  "Technology",
  "Business",
  "Sports",
  "Internet of Things",
  "Private Jobs",
  "Study Material",
  "Edushop",
  "Coaching",
  "Library",
  "Tuition Class",
  "Other",
];


// [moible no. , unique name, channel name, channel description, channel category, refral mon no., refral commision,]