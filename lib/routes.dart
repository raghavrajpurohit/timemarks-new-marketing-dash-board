import 'package:go_router/go_router.dart';

import 'package:new_marketing_dash_board/pages/home_page.dart';

class MyRoutes {
  static routeFunction() {
    GoRouter routes = GoRouter(routes: [
      GoRoute(
        path: HomeScreen.pageId,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ]);
    return routes;
  }
}
