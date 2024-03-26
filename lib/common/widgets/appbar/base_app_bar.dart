import 'package:flutter/material.dart';

import '../../../core/config/scale/scale.dart';
import '../../../core/config/style/style.dart';
import '../../../core/config/theme/app_colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BaseAppBar({
    Key ? key,
    required this.title,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
       preferredSize: const Size.fromHeight(50.0),
       child: AppBar(
        leadingWidth: Scale.of(context).moderateScale(30),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: AppFontSize(context).size14()
          ),
        ),
        backgroundColor: AppColors.oil,
        centerTitle: true,
      ),
    );
  }

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}