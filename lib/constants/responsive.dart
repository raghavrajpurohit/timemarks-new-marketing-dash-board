import 'package:flutter/material.dart';

enum ResponsiveD {
  mobile,
  tablet,
  desktop;

  static ResponsiveD d(context) {
    if (MediaQuery.of(context).size.width <= 599) {
      return ResponsiveD.mobile;
    } else if (MediaQuery.of(context).size.width <= 1439) {
      return ResponsiveD.tablet;
    } else {
      return ResponsiveD.desktop;
    }
  }
}
