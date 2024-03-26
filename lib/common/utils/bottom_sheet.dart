import 'package:flutter/material.dart';

import '../../core/config/style/style.dart';
import '../../core/config/theme/app_colors.dart';

class AppBottomSheet {

 static void display({
   required BuildContext context,
   required Widget widget,
 }) async {
   return showModalBottomSheet(
     context: context,
     isScrollControlled: true,
     backgroundColor: AppColors.blackBackground,
     shape: RoundedRectangleBorder(
       borderRadius: AppBorderRadius.trtl25()
     ),
     builder: (_) {
       return widget;
     },
   );
 }
}