import 'package:flutter/material.dart';

class color {
// light theme
  static Color color1 = const Color(0xffFFFFFF);
  static Color color2 = const Color(0xff000000);
  static Color color3 = const Color(0xff272343);
  static Color color4 = const Color(0xffE3F6F5);
  static Color color5 = const Color(0xffBAE8E8);

  static Color white = const Color(0xffFFFFFF);
  static Color black = const Color(0xff000000);
  static Color purple = const Color(0xff272343);
  static Color deepwhite = const Color(0xffE3F6F5);
  static Color lightblue = const Color(0xffBAE8E8);

  static switchTheme(bool isDark) {
    if (!isDark) {
      color1 = white;
      color2 = black;
      color3 = purple;
      color4 = deepwhite;
      color5 = lightblue;
    } else {
      color1 = black;
      color2 = white;
      color3 = green;
      color4 = lightgrey;
      color5 = grey;
    }
  }

// dark theme
  static Color grey = const Color(0xff212121);
  static Color blurywhite = const Color.fromRGBO(255, 255, 255, 0.65);
  static Color green = const Color(0xff0D7377);
  static Color lightgrey = const Color(0xff323232);
}
