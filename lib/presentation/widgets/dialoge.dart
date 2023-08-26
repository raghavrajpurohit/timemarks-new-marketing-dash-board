import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/constants/colors.dart';
import 'package:new_marketing_dash_board/constants/responsive.dart';
import 'package:new_marketing_dash_board/presentation/widgets/myTextWidget.dart';
import 'package:timelines/timelines.dart';

class MyDialoges extends StatefulWidget {
  static const String pageId = "/aa";
  const MyDialoges({super.key});

  @override
  State<MyDialoges> createState() => _MyDialogesState();
}

class _MyDialogesState extends State<MyDialoges> {
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
              Expanded(flex: 1, child: Container(child: row1(context))),
              Expanded(flex: 6, child: Container(child: row2(context))),
              Expanded(flex: 1, child: Container(child: row3())),
            ],
          ),
        ),
      ),
    );
  }
}

row1(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: MyColor.borderColor, width: 1.5))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyTextWidget(
                  content: "Application for e-Mitra",
                  fontSize: 20,
                  fontbold: FontWeight.bold,
                ),
                (ResponsiveD.d(context) == ResponsiveD.mobile)
                    ? ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            maximumSize:
                                !(ResponsiveD.d(context) == ResponsiveD.mobile)
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

row2(context) {
  return SizedBox(
    height: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 3 : 5,
            child: container1(context)),
        Expanded(flex: 8, child: container2(context)),
      ],
    ),
  );
}

row3() {
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
                        onPressed: () {},
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

container1(context) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(right: BorderSide(color: MyColor.borderColor, width: 1.5))),
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
                      const NetworkImage("https://picsum.photos/250/300"),
                ),
                SizedBox(
                  width: ResponsiveD.d(context) == ResponsiveD.desktop ? 10 : 5,
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

container2(context) {
  return SizedBox(
    height: double.infinity,
    child: Padding(
      padding: EdgeInsets.only(
        left: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
        right: !(ResponsiveD.d(context) == ResponsiveD.mobile) ? 16 : 8,
        top: 16,
      ),
      child: Scrollbar(
        radius: const Radius.circular(5),
        thumbVisibility: true,
        thickness: 3,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
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
    ),
  );
}

innerContaner() {
  return Column(
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
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                side: BorderSide(
                    color: const Color(0xff262338).withOpacity(0.70),
                    width: 1.5),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            child: MyTextWidget(
              content: "Mark as Issue",
              fontSize: 14,
              myColor: const Color(0xff262338).withOpacity(0.70),
            ),
          )
        ],
      )
    ],
  );
}

mytimeline() {
  return Expanded(
      child: SizedBox(
          width: 200,
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              color: MyColor.blackText,
              direction: Axis.vertical,
              nodePosition: 0,
              indicatorTheme: const IndicatorThemeData(size: 20),
              connectorTheme: const ConnectorThemeData(),
            ),
            builder: TimelineTileBuilder.fromStyle(
              itemCount: 4,
              connectorStyle: ConnectorStyle.dashedLine,
              contentsAlign: ContentsAlign.basic,
              endConnectorStyle: ConnectorStyle.dashedLine,
              contentsBuilder: (context, index) {
                return;
              },
            ),
          )));
}
