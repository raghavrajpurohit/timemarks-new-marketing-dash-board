import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/colors.dart';
import 'package:new_marketing_dash_board/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Marketing DashBoard UI',
        routerConfig: MyRoutes.routeFunction(),
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: backgroundColor));
  }
}
