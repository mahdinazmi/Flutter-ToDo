import 'package:flutter/material.dart';
import 'package:todo/core/config/localizations/localizations.dart';

import '../../../core/config/theme/app_colors.dart';

class NotFoundTask extends StatelessWidget {
  const NotFoundTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
              AppLocalizations.of(context)!.translate('not_found_task')!,
              style: const TextStyle(
                color: AppColors.white
              )
            ),
          ),
      ],
    );
  }
}