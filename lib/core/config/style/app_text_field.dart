import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_font_size.dart';


class AppTextField {

  late BuildContext _context;

  AppTextField(context) {
    _context = context;
  }

  InputDecoration appTextFieldDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.textFieldBackground,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.35),
          width: 1
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(
          color: Colors.white.withOpacity(0.35),
          width: 1
        )
      ),
      hintStyle: TextStyle(
        color: AppColors.tint300,
        fontWeight: FontWeight.w400,
        fontSize: AppFontSize(_context).size11()
      )
    );
  }

  InputDecoration noneBorder() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.textFieldBackground,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide.none
      ),
      hintStyle: TextStyle(
        color: AppColors.tint300,
        fontWeight: FontWeight.w400,
        fontSize: AppFontSize(_context).size11()
      )
    );
  }

  TextStyle textStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: AppFontSize(_context).size14(),
      fontWeight: FontWeight.w500
    );
  }

}