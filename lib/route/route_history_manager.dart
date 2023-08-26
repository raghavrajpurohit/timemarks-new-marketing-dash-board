import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_marketing_dash_board/data/network_helper/html_js.dart';

List _navigationHistory = [];
bool isPreviousRemove = false;

class GoRouterHistoryManagerAndObserver extends NavigatorObserver {
  static const String routeHistory = 'flutter.shared_route_history_key';

  static List? getCompleteHistory() {
    List? out = WebLocalStorage.getStringJson(routeHistory);
    _navigationHistory.clear();
    _navigationHistory.addAll(out ?? []);
    return _navigationHistory;
  }

  static bool? clearCompleteHistory() {
    bool? out = WebLocalStorage.setStringJson(key: routeHistory, data: []);
    _navigationHistory.clear();
    return out;
  }

  static String getSecondLastPath() {
    List? outList = WebLocalStorage.getStringJson(routeHistory);
    _navigationHistory.clear();
    _navigationHistory.addAll(outList ?? []);
    if (_navigationHistory.length >= 2) {
      return _navigationHistory[_navigationHistory.length - 2];
    } else {
      return "";
    }
  }

  static bool? addToHistory(String path) {
    List? outList = WebLocalStorage.getStringJson(routeHistory);
    _navigationHistory.clear();
    _navigationHistory.addAll(outList ?? []);
    if (_navigationHistory.isNotEmpty) {
      if (path == _navigationHistory.last) {
        return false;
      }
    }
    if (_navigationHistory.length > 5) {
      _navigationHistory.removeAt(0);
    }
    _navigationHistory.add(path);
    bool? out = WebLocalStorage.setStringJson(
        key: routeHistory, data: _navigationHistory);
    return out;
  }

  static bool? removeToHistory(String path) {
    List? outList = WebLocalStorage.getStringJson(routeHistory);
    _navigationHistory.clear();
    _navigationHistory.addAll(outList ?? []);
    _navigationHistory.remove(path);
    bool? out = WebLocalStorage.setStringJson(
        key: routeHistory, data: _navigationHistory);
    return out;
  }

  static bool? pop(BuildContext context, int until, bool mounted) {
    List? outList = WebLocalStorage.getStringJson(routeHistory);
    _navigationHistory.clear();
    _navigationHistory.addAll(outList ?? []);
    for (int i = 1; i <= until; i++) {
      _navigationHistory.removeLast();
    }
    if (_navigationHistory.isNotEmpty) {
      if (mounted) {
        context.go(_navigationHistory.last);
      }
    } else {
      if (mounted) {
        context.go("/");
      }
    }
    bool? out = WebLocalStorage.setStringJson(
        key: routeHistory, data: _navigationHistory);
    return out;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    // if (route.settings.name == "/") {
    //   clearCompleteHistory();
    // }
    if (route.settings.name != null) {
      addToHistory(Uri(
              path: route.settings.name,
              queryParameters:
                  route.settings.arguments as Map<String, dynamic>?)
          .toString());
    }
    // NetworkWebHtmlJs.setSessionLastPath(
    //   Uri(
    //           path: route.settings.name,
    //           queryParameters:
    //               route.settings.arguments as Map<String, dynamic>?)
    //       .toString(),
    // );
    log("push: ${route.settings.name}, $_navigationHistory");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    // if (route.settings.name == "/") {
    //   clearCompleteHistory();
    // }
    // if (route.settings.name != null) {
    //   await removeToHistory(Uri(
    //           path: route.settings.name,
    //           queryParameters:
    //               route.settings.arguments as Map<String, dynamic>?)
    //       .toString());
    // }
    log("Pop: ${route.settings.name}, $_navigationHistory");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    isPreviousRemove = true;
    // if (route.settings.name == "/") {
    //   clearCompleteHistory();
    // }
    // if (route.settings.name != null) {
    //   await removeToHistory(Uri(
    //           path: route.settings.name,
    //           queryParameters:
    //               route.settings.arguments as Map<String, dynamic>?)
    //       .toString());
    // }
    log("Remove: ${route.settings.name}, $_navigationHistory");
  }
}
