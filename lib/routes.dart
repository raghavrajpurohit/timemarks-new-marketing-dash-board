import 'package:go_router/go_router.dart';
import 'package:new_marketing_dash_board/pages/Hirring.dart';
import 'package:new_marketing_dash_board/pages/channel.dart';
import 'package:new_marketing_dash_board/pages/home.dart';

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
        path: HomeScreen.pageId,
        builder: (context, state) {
          return const HomeScreen();
        },
      )
    ]);
    return routes;
  }
}
