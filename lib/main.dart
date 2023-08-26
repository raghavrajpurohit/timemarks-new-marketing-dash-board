import 'package:flutter/material.dart';
import 'package:new_marketing_dash_board/route/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
      title: 'Studyem',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
