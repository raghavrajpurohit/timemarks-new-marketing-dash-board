import 'package:go_router/go_router.dart';

import 'package:new_marketing_dash_board/pages/hirring.dart';
import 'package:new_marketing_dash_board/pages/channel.dart';
import 'package:new_marketing_dash_board/pages/homePage.dart';
import 'package:new_marketing_dash_board/reponsive.dart';

class MyRoutes {
  static routeFunction() {
    GoRouter routes = GoRouter(routes: [
      GoRoute(
        path: ChannelPage.pageId,
        builder: (context, state) {
          return const ChannelPage();
        }, // how to use url? and what use of shell route?
      ),
      GoRoute(
        path: HirringPage.pageId,
        builder: (context, state) {
          return const HirringPage();
        },
      ),
      GoRoute(
        path: HomePage.pageId,
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ]);
    return routes;
  }
}
