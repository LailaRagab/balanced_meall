import 'package:flutter/material.dart';

import '../../../../core/utils/assets/colors/app_colors.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 12,
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}
