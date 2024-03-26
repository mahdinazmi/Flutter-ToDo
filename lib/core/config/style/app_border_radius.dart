import 'package:flutter/material.dart';

class AppBorderRadius {
  
  static BorderRadiusGeometry trtl25() => const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25)
  );

  static BorderRadiusGeometry all14() => BorderRadius.circular(14);
  
  static BorderRadiusGeometry all12() => BorderRadius.circular(12);
}