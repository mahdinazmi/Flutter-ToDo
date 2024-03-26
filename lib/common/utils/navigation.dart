import 'package:flutter/material.dart';

class Navigation {

  static void navigatorPush(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route ,
      )
    );
  }
}