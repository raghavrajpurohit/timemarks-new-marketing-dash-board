import 'package:flutter/material.dart';

enum ResponsiveD {
  mobile,
  tablet,
  tabelPortrait,
  desktop;

  static ResponsiveD d(context) {
    if (MediaQuery.of(context).size.width <= 599) {
      return ResponsiveD.mobile;
    } else if (MediaQuery.of(context).size.width <= 1439) {
      return ResponsiveD.tablet;
    } else if (MediaQuery.of(context).size.width <= 900) {
      return ResponsiveD.tabelPortrait;
    } else {
      return ResponsiveD.desktop;
    }
  }
}
