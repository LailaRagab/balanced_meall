import 'package:balanced_meal/features/create_your_order_feature/presentation/widgets/circle_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets/colors/app_colors.dart';

class BuildCounter extends StatelessWidget {
  const BuildCounter({
    super.key,
    required this.quantity,
    required this.increment,
    required this.decrement,
  });
  final VoidCallback increment;
  final VoidCallback decrement;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          CircleButton(onTap: decrement, icon: Icons.remove),
          const SizedBox(width: 8),
          Text(
            '$quantity',
            style: TextStyle(
              color: AppColors.kAxisScrollViewTitle,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          CircleButton(onTap: increment, icon: Icons.add),
        ],
      ),
    );
  }
}
