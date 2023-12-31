import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/responsive.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';

class MyDialogesDetails extends StatefulWidget {
  static const String pageId = "/details";
  const MyDialogesDetails({super.key});

  @override
  State<MyDialogesDetails> createState() => _MyDialogesDetailsState();
}

class _MyDialogesDetailsState extends State<MyDialogesDetails> {
  PageController controller = PageController(initialPage: 0);
  int _curr = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.greyWidgetColor.withOpacity(0.3),
      body: Center(
        child: Container(
          width: ResponsiveD.d(context) == ResponsiveD.desktop
              ? 894
              : ResponsiveD.d(context) == ResponsiveD.tablet
                  ? 700
                  : 380,
          height: 572,
          decoration: BoxDecoration(
              color: MyColor.whiteContainer,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Expanded(flex: 1, child: Container(child: topRow(context))),
              Expanded(
                  flex: 6,
                  child: Container(child: middleRow(context, controller))),
              Expanded(flex: 1, child: Container(child: endRow())),
            ],
          ),
        ),
      ),
    );
  }

  topRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: MyColor.borderColor, width: 1.5))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyTextWidget(
                    content: "Application For e-Mitra",
                    fontSize: 20,
                    fontbold: FontWeight.bold,
                  ),
                  (ResponsiveD.d(context) == ResponsiveD.mobile)
                      ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              maximumSize: !(ResponsiveD.d(context) ==
                                      ResponsiveD.mobile)
                                  ? const Size.fromWidth(150)
                                  : const Size.fromWidth(120),
                              side: BorderSide(
                                  width: 1.5, color: MyColor.borderColor),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          child: MyTextWidget(
                            content: "Mark as Issue",
                            myColor: MyColor.greyText,
                            fontSize:
                                !(ResponsiveD.d(context) == ResponsiveD.mobile)
                                    ? 12
                                    : 10,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  middleRow(context, PageController controller) {
    return SizedBox(
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 3 : 5,
              child: progressIndicatorContainer(context)),
          Expanded(
              flex: 8,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (index) {
                  _curr = index;
                },
                children: _getList(context),
              )),
        ],
      ),
    );
  }

  progressIndicatorContainer(context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(color: MyColor.borderColor, width: 1.5))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius:
                        ResponsiveD.d(context) == ResponsiveD.desktop ? 20 : 15,
                    backgroundImage:
                        const NetworkImage("https://picsum.photos/300/300"),
                  ),
                  SizedBox(
                    width:
                        ResponsiveD.d(context) == ResponsiveD.desktop ? 10 : 5,
                  ),
                  const MyTextWidget(
                    content: "RK Singh",
                    fontSize: 14,
                    fontbold: FontWeight.bold,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getList(BuildContext ctx) => <Widget>[
        detailsContainer(ctx),
        documentsContainer(ctx),
        permissionContainer(ctx),
        finalContainer(ctx),
      ];
  Widget finalContainer(context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          right: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTextWidget(
              content: "Form Status",
              fontSize: 14,
              fontbold: FontWeight.bold,
            ),
            const SizedBox(
              height: 8,
            ),
            Wrap(
              runSpacing:
                  !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 20 : 10,
              spacing:
                  !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 20 : 200,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                FilledButton.tonal(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                        color: MyColor.blackText.withOpacity(0.30), width: 2)),
                    backgroundColor:
                        MaterialStateProperty.all(MyColor.whiteContainer),
                  ),
                  child: MyTextWidget(
                    content: "Hired",
                    myColor: MyColor.greyText,
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                        color: MyColor.blackText.withOpacity(0.30), width: 2)),
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  child: MyTextWidget(
                    content: "Pending",
                    myColor: MyColor.whiteTextColor,
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                        color: MyColor.blackText.withOpacity(0.30), width: 2)),
                    backgroundColor:
                        MaterialStateProperty.all(MyColor.whiteContainer),
                  ),
                  child: MyTextWidget(
                    content: "Rajected",
                    myColor: MyColor.greyText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget detailsContainer(context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          right: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          top: 16,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyTextWidget(
                    content: "Basic Details",
                    fontSize: 20,
                    fontbold: FontWeight.bold,
                  ),
                  !(ResponsiveD.d(context) == ResponsiveD.mobile)
                      ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              maximumSize: !(ResponsiveD.d(context) ==
                                      ResponsiveD.mobile)
                                  ? const Size.fromWidth(150)
                                  : const Size.fromWidth(120),
                              side: BorderSide(
                                  width: 1.5, color: MyColor.borderColor),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          child: MyTextWidget(
                            content: "Mark as Issue",
                            myColor: MyColor.greyText,
                            fontSize:
                                !(ResponsiveD.d(context) == ResponsiveD.mobile)
                                    ? 12
                                    : 10,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Wrap(
                runSpacing: 5,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        content: "Mobile Number",
                        fontSize: 14,
                        myColor: MyColor.greyText,
                      ),
                      const SizedBox(height: 3),
                      const MyTextWidget(
                        content: "+91-7733982270",
                        fontbold: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                        ? 255
                        : 100, //jugaad
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        content: "Email Address",
                        fontSize: 14,
                        myColor: MyColor.greyText,
                      ),
                      const SizedBox(height: 3),
                      const MyTextWidget(
                        content: "xyz123@gmail.com",
                        fontbold: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const MyTextWidget(
                content: "Education",
                fontSize: 20,
                fontbold: FontWeight.bold,
              ),
              const SizedBox(
                height: 6,
              ),
              Wrap(
                runSpacing: 5,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        content: "Bachelor of Engineering",
                        fontSize: 14,
                      ),
                      SizedBox(height: 3),
                      MyTextWidget(
                        content: "IIT Bombay  (2011 - 2015)",
                        fontbold: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                        ? 200
                        : 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        content: "Bachelor of Engineering",
                        fontSize: 14,
                        myColor: MyColor.greyText,
                      ),
                      const SizedBox(height: 3),
                      const MyTextWidget(
                        content: "IIT Bombay  (2011 - 2015)",
                        fontbold: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const MyTextWidget(
                content: "Achievements",
                fontSize: 20,
                fontbold: FontWeight.bold,
              ),
              const SizedBox(
                height: 6,
              ),
              Wrap(
                runSpacing: 5,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        content: "Best Player of the Match",
                        fontSize: 14,
                        myColor: MyColor.greyText,
                      ),
                      const SizedBox(height: 3),
                      const MyTextWidget(
                        content: "Rajasthan Olympics  (2011 - 2015))",
                        fontbold: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                        ? 200
                        : 100,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const MyTextWidget(
                content: "Hobbies",
                fontSize: 20,
                fontbold: FontWeight.bold,
              ),
              const SizedBox(
                height: 6,
              ),
              Wrap(
                runSpacing: 10,
                children: [
                  FilledButton.tonal(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          MyColor.greyWidgetColor.withOpacity(0.2)),
                    ),
                    child: const MyTextWidget(
                      content: "Books Reading",
                      fontbold: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                        ? 10
                        : 20,
                  ),
                  FilledButton.tonal(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          MyColor.greyWidgetColor.withOpacity(0.2)),
                    ),
                    child: const MyTextWidget(
                      content: "Cricket",
                      fontbold: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                        ? 10
                        : 20, //jugaad
                  ),
                  FilledButton.tonal(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          MyColor.greyWidgetColor.withOpacity(0.2)),
                    ),
                    child: const MyTextWidget(
                      content: "Programming",
                      fontbold: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget documentsContainer(context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          right: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          top: 16,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              myContainer(context, "10th Class Marksheet"),
              SizedBox(
                height:
                    !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
              ),
              myContainer(context, "12th Class Marksheet"),
              SizedBox(
                height:
                    !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
              ),
              myContainer(context, "e-Mitra Certificate"),
              SizedBox(
                height:
                    !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
              ),
              myContainer(context, "Aadhaar Card"),
            ],
          ),
        ),
      ),
    );
  }

  Widget myContainer(context, String title) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: MyColor.borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextWidget(
                      content: title,
                      fontSize: 20,
                      fontbold: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      runSpacing: 10,
                      spacing: 15,
                      children: [
                        FilledButton.tonal(
                          onPressed: () {},
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: MyColor.blackText.withOpacity(0.30),
                                width: 2)),
                            backgroundColor: MaterialStateProperty.all(
                                MyColor.whiteContainer),
                          ),
                          child: MyTextWidget(
                            content: "View File",
                            myColor: MyColor.greyText,
                          ),
                        ),
                        SizedBox(
                          width: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                              ? 10
                              : 20,
                        ),
                        FilledButton.tonal(
                          onPressed: () {},
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: MyColor.blackText.withOpacity(0.30),
                                width: 2)),
                            backgroundColor: MaterialStateProperty.all(
                                MyColor.whiteContainer),
                          ),
                          child: MyTextWidget(
                            content: "Download",
                            myColor: MyColor.greyText,
                          ),
                        ),
                        SizedBox(
                          width: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                              ? 10
                              : 20, //jugaad
                        ),
                        FilledButton.tonal(
                          onPressed: () {},
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: MyColor.blackText.withOpacity(0.30),
                                width: 2)),
                            backgroundColor: MaterialStateProperty.all(
                                MyColor.whiteContainer),
                          ),
                          child: MyTextWidget(
                            content: "Mark as Issue",
                            myColor: MyColor.greyText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: !(ResponsiveD.d(context) == ResponsiveD.mobile)
                          ? 30
                          : 10,
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }

  int? channelStatus;

  Widget permissionContainer(context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          right: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTextWidget(
              content: "e-Mitra Permission for",
              fontSize: 14,
              fontbold: FontWeight.bold,
            ),
            const SizedBox(
              height: 6,
            ),
            Wrap(
              spacing:
                  ResponsiveD.d(context) == ResponsiveD.desktop ? 200 : 100,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<int>(
                      onChanged: (value) {
                        channelStatus = value;
                        setState(() {});
                      },
                      value: 1,
                      groupValue: channelStatus,
                    ),
                    const MyTextWidget(
                      content: "All Channels",
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<int>(
                      onChanged: (value) {
                        channelStatus = value;
                        setState(() {});
                      },
                      value: 2,
                      groupValue: channelStatus,
                    ),
                    const MyTextWidget(
                      content: "Specific Channels",
                    )
                  ],
                ),
              ],
            ),
            if (channelStatus != null)
              channelStatus == 1 ? allChannelsWidget() : specificChannels(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  endRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: MyColor.borderColor, width: 1.5))),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: MyTextWidget(
                            content: "CANCEL",
                            fontSize: 18,
                            myColor: MyColor.greyWidgetColor,
                            fontbold: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            if (_curr < _getList(context).length) {
                              controller.animateToPage(_curr + 1,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.ease);
                            }
                          },
                          child: const MyTextWidget(
                            content: "NEXT",
                            fontSize: 18,
                            myColor: Color(0xff3E92E0),
                            fontbold: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }

  allChannelsWidget() {
    return Expanded(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: MyColor.borderColor),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columnSpacing:
                        (ResponsiveD.d(context) == ResponsiveD.mobile)
                            ? 100
                            : (ResponsiveD.d(context) == ResponsiveD.tablet)
                                ? 150
                                : 250,
                    showCheckboxColumn: true,
                    columns: [
                      DataColumn(
                          label: MyTextWidget(
                              content: "CHANNELS",
                              myColor: MyColor.greyText,
                              fontbold: FontWeight.bold)),
                      DataColumn(
                          label: MyTextWidget(
                              content: "ACTION",
                              myColor: MyColor.greyText,
                              fontbold: FontWeight.bold)),
                    ],
                    rows: [
                      for (Map m in tabelList)
                        DataRow(
                          cells: [
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
                            DataCell(IconButton(
                              icon: const Icon(Icons.add_box_outlined),
                              onPressed: () {},
                            )),
                          ],
                        )
                    ]),
              ),
            ])),
      ),
    ));
  }

  specificChannels() {
    return Expanded(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: MyColor.borderColor),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(children: [
              ElevatedButton(
                style: ButtonStyle(elevation: MaterialStateProperty.all(1)),
                child: const MyTextWidget(content: "Choose Channel"),
                onPressed: () {
                  showDialog(
                      builder: (context) => insideAllChannelsWidget(),
                      context: context);
                },
              ),
              const Divider(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columnSpacing:
                        (ResponsiveD.d(context) == ResponsiveD.mobile)
                            ? 100
                            : (ResponsiveD.d(context) == ResponsiveD.tablet)
                                ? 150
                                : 250,
                    showCheckboxColumn: true,
                    columns: [
                      DataColumn(
                          label: MyTextWidget(
                              content: "SELECTED CHANNELS (9)",
                              myColor: MyColor.greyText,
                              fontbold: FontWeight.bold)),
                      DataColumn(
                          label: MyTextWidget(
                              content: "ACTION",
                              myColor: MyColor.greyText,
                              fontbold: FontWeight.bold)),
                    ],
                    rows: [
                      for (Map m in tabelList)
                        DataRow(
                          cells: [
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
                            DataCell(IconButton(
                              icon: const Icon(Icons.highlight_remove_outlined),
                              onPressed: () {},
                            )),
                          ],
                        )
                    ]),
              ),
            ])),
      ),
    ));
  }

  insideAllChannelsWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 100),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: MyColor.whiteContainer,
                  border: Border.all(color: MyColor.borderColor),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columnSpacing: (ResponsiveD.d(context) ==
                                  ResponsiveD.mobile)
                              ? 100
                              : (ResponsiveD.d(context) == ResponsiveD.tablet)
                                  ? 150
                                  : 250,
                          showCheckboxColumn: true,
                          columns: [
                            DataColumn(
                                label: MyTextWidget(
                                    content: "CHANNELS",
                                    myColor: MyColor.greyText,
                                    fontbold: FontWeight.bold)),
                            DataColumn(
                                label: MyTextWidget(
                                    content: "ACTION",
                                    myColor: MyColor.greyText,
                                    fontbold: FontWeight.bold)),
                          ],
                          rows: [
                            for (Map m in tabelList)
                              DataRow(
                                cells: [
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
                                  DataCell(IconButton(
                                    icon: const Icon(Icons.add_box_outlined),
                                    onPressed: () {},
                                  )),
                                ],
                              )
                          ]),
                    ),
                  ])),
            ),
          ),
        ),
      ),
    );
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
