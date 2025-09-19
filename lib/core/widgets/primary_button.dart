import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.rad,
    required this.width,
    required this.height,
    required this.text,
    required this.style,
  });

  final VoidCallback onPressed;
  final double rad;
  final double width;
  final double height;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
        ),
      ),
      child: Text(text, style: style),
    );
  }
}
