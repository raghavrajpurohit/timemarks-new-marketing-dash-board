import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_marketing_dash_board/presentation/screens/hirring/hirring_form_applicants/hirring_forms_applicants.dart';
import 'package:new_marketing_dash_board/presentation/screens/home_page.dart';
import 'package:new_marketing_dash_board/presentation/widgets/dialoge.dart';
import 'package:new_marketing_dash_board/route/route_history_manager.dart';

GoRouter routes = GoRouter(
  observers: [GoRouterHistoryManagerAndObserver()],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('404'),
    ),
  ),
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: HomeScreen.pageId,
      builder: (context, state) {
        return HomeScreen(
            initialIndex: state.uri.queryParameters['initialIndex'] != null
                ? int.parse(state.uri.queryParameters['initialIndex']!)
                : null);
      },
    ),
    GoRoute(
      path: HirringFormApplicants.pageId,
      builder: (context, state) {
        return HirringFormApplicants(
            initialIndex: state.uri.queryParameters['initialIndex'] != null
                ? int.parse(state.uri.queryParameters['initialIndex']!)
                : null);
      },
    ),
    GoRoute(
      path: MyDialoges.pageId,
      builder: (context, state) {
        return const MyDialoges();
      },
    ),
  ],
);
