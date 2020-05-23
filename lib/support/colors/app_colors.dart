import 'package:flutter/material.dart';

class AppColors extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  static Color bgColor = Color(_getColorFromHex("3E416D"));

  AppColors(final String hexColor) : super(_getColorFromHex(hexColor));
}
