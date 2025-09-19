import 'package:balanced_meal/core/utils/assets/app_styles/app_styles.dart';
import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;
  final String text;
  const NextButton({
    super.key,
    required this.enabled,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            enabled
                ? AppColors
                    .primaryColor // active colour
                : AppColors.kBgNextButtonColor, // inactive colour
        foregroundColor: Colors.white, // text/icon colour
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        fixedSize: const Size(327, 60),
      ),
      onPressed: enabled ? onPressed : null, // disabled when false
      child: Text(
        text,
        style: AppStyles.font16LightGrey.copyWith(
          fontWeight: FontWeight.bold,
          color: enabled ? AppColors.kWhite : AppColors.kLightGrey,
        ),
      ),
    );
  }
}
