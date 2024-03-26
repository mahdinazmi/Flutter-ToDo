import 'package:flutter/material.dart';

import '../scale/scale.dart';

class AppFontSize {
  late BuildContext _context;

  AppFontSize(context) {
    _context = context;
  }

  double size18() {
    return Scale.of(_context).fontSize(2.2);
  }

  double size16() {
    return Scale.of(_context).fontSize(2.05);
  }

  double size14() {
    return Scale.of(_context).fontSize(1.9);
  }

  double size13() {
    return Scale.of(_context).fontSize(1.75);
  }

  double size12() {
    return Scale.of(_context).fontSize(1.6);
  }

  double size11() {
    return Scale.of(_context).fontSize(1.5);
  }

  double size10() {
    return Scale.of(_context).fontSize(1.3);
  }

  double size9() {
    return Scale.of(_context).fontSize(1.1);
  }


}