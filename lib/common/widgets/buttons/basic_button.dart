import 'package:flutter/material.dart';
import '../../../core/config/scale/scale.dart';
import '../../../core/config/style/style.dart';
import '../../../core/config/theme/app_colors.dart';


class BasicButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color ? color;
  final VoidCallback onPressed;
  final bool isActive;
  const BasicButton({
    super.key, 
    required this.title,
    required this.onPressed,
     this.isActive = true,
     this.color,
     this.width = 170,
     this.height = 48
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color ?? AppColors.primary,
      height: Scale.of(context).moderateScale(height),
      elevation: 0,
      minWidth: Scale.of(context).moderateScale(width),
      onPressed: isActive ? onPressed : null,
      disabledColor: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppFontSize(context).size14(),
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}

class BasicNonFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color ? color;
  final Color ? titleColor;
  final VoidCallback onPressed;
  final bool isActive;
  const BasicNonFilledButton({
    super.key, 
    required this.title,
    required this.onPressed,
     this.isActive = true,
     this.color,
     this.titleColor,
     this.width = 170,
     this.height = 48
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color ?? AppColors.blackBackground,
      height: Scale.of(context).moderateScale(height),
      elevation: 0,
      minWidth: Scale.of(context).moderateScale(width),
      onPressed: isActive ? onPressed : null,
      disabledColor: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: AppColors.primary,
          width: 1
        )
      ),
      child: Text(
        title,
        style: TextStyle(
          color: titleColor ?? AppColors.primary,
          fontSize: AppFontSize(context).size14(),
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}