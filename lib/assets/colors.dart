import 'package:flutter/material.dart';

class color {
// light theme
  static Color color1 = const Color(0xffFFFFFF);
  static Color color2 = const Color(0xff000000);
  static Color color3 = const Color(0xff272343);
  static Color color4 = const Color(0xffE3F6F5);
  static Color color5 = const Color(0xffBAE8E8);

  static const Color _white =  Color(0xffFFFFFF);
  static const Color _black =  Color(0xff000000);
  static const Color _purple =  Color(0xff272343);
  static const Color _deepWhite =  Color(0xffE3F6F5);
  static const Color _lightblue =  Color(0xffBAE8E8);

  static switchTheme(bool isDark) {
    if (!isDark) {
      color1 = _white;
      color2 = _black;
      color3 = _purple;
      color4 = _deepWhite;
      color5 = _lightblue;
    } else {
      color1 = _black;
      color2 = _white;
      color3 = _green;
      color4 = _lightgrey;
      color5 = _grey;
    }
  }

// dark theme
  static const Color _grey =  Color(0xff212121);
  // static const Color _blurywhite =  Color.fromRGBO(255, 255, 255, 0.65);
  static const Color _green =  Color(0xff0D7377);
  static const Color _lightgrey =  Color(0xff323232);
}
