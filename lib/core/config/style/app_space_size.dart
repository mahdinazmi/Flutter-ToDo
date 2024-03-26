import 'package:flutter/material.dart';

import '../scale/scale.dart';

class AppSpace {
  late BuildContext _context;

  AppSpace(context) {
    _context = context;
  }

  EdgeInsetsGeometry allSide16() {
    return EdgeInsets.all(
      Scale.of(_context).moderateScale(16)
    );
  }

  EdgeInsetsGeometry allSide12() {
    return EdgeInsets.all(
      Scale.of(_context).moderateScale(12)
    );
  }

  EdgeInsetsGeometry allSide14() {
    return EdgeInsets.all(
      Scale.of(_context).moderateScale(14)
    );
  }

  EdgeInsetsGeometry allSide8() {
    return EdgeInsets.all(
      Scale.of(_context).moderateScale(8)
    );
  }

  EdgeInsetsGeometry rl16() {
    return EdgeInsets.only(
      right:Scale.of(_context).moderateScale(16),
      left: Scale.of(_context).moderateScale(16)
    );
  }

   EdgeInsetsGeometry rl8() {
    return EdgeInsets.only(
      right:Scale.of(_context).moderateScale(8),
      left: Scale.of(_context).moderateScale(8)
    );
  }
}