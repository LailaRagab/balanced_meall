import 'package:balanced_meal/features/create_your_order_feature/presentation/widgets/build_counter.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets/app_styles/app_styles.dart';
import '../../../../core/utils/assets/colors/app_colors.dart';

class SummaryItemPriceAndCounter extends StatefulWidget {
  const SummaryItemPriceAndCounter({
    super.key,
    required this.onQuantityChanged,
    required this.pricePerUnit,
  });

  /// 🔔 Callback to notify parent when quantity changes
  final ValueChanged<int> onQuantityChanged;
  final int pricePerUnit;

  @override
  State<SummaryItemPriceAndCounter> createState() =>
      _SummaryItemPriceAndCounterState();
}

class _SummaryItemPriceAndCounterState
    extends State<SummaryItemPriceAndCounter> {
  bool isAdded = false;
  int quantity = 0;

  void notify() => widget.onQuantityChanged(quantity);

  void increment() {
    setState(() {
      quantity++;
    });
    notify();
  }

  void decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        quantity = 0;
        isAdded = false;
      }
    });
    notify();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$12",
          style: AppStyles.font16White.copyWith(
            color: AppColors.kAxisScrollViewTitle,
          ),
        ),
        BuildCounter(
          quantity: quantity,
          increment: increment,
          decrement: decrement,
        ),
      ],
    );
  }
}
