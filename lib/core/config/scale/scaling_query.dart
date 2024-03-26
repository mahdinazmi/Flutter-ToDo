import 'dart:math';

import 'package:flutter/material.dart';


class ScalingQuery {
  final _guidelineBaseHeight = 680;

  late double _shortDimension;
  late double _longDimension;

  ScalingQuery(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _shortDimension = width < height ? width : height;
    _longDimension = width < height ? height : width;
  }

  double fontSize(double size) {
    var tempLongDimension = (16 / 9) * _shortDimension;
    return sqrt(pow(tempLongDimension, 2) + pow(_shortDimension, 2)) * (size / 100);
  }

  double scale(double size,[double gridWidth = 350.0]) {
    return _shortDimension / gridWidth * size;
  }

  double verticalScale(double size) {
    return _longDimension / _guidelineBaseHeight * size;
  }

  double moderateScale(double size, [double factor = 1.0,double gridWidth = 375.0]) {
    return size + (scale(size,gridWidth) - size) * factor;
  }

  double hp(size) {
    return (_longDimension * size) / 100;
  }

  double wp(size) {
    return (_shortDimension * size) / 100;
  }
}
