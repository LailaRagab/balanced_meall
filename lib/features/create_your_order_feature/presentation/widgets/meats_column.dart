import 'package:flutter/material.dart';
import '../../../../core/utils/assets/app_styles/app_styles.dart';
import '../../../../core/utils/assets/colors/app_colors.dart';
import '../../../../core/utils/assets/images/app_images.dart';
import 'category_card.dart';

class MeatsColumn extends StatefulWidget {
  const MeatsColumn({
    super.key,
    required this.onTotalChanged,
    required this.onCalsChanged,
  });

  final ValueChanged<int> onTotalChanged; // إجمالي كميّات اللحوم
  final ValueChanged<int> onCalsChanged; // إجمالي سعرات اللحوم

  @override
  State<MeatsColumn> createState() => _MeatsColumnState();
}

class _MeatsColumnState extends State<MeatsColumn> {
  /// index → quantity
  final Map<int, int> _qtyMap = {};

  /// index → calories
  final Map<int, int> _calMap = {};

  void _notifyParent() {
    final totalQty = _qtyMap.values.fold<int>(0, (s, e) => s + e);
    final totalCals = _calMap.values.fold<int>(0, (s, e) => s + e);
    widget.onTotalChanged(totalQty);
    widget.onCalsChanged(totalCals);
  }

  void _onCardQtyChanged(int index, int q) {
    _qtyMap[index] = q;
    _notifyParent();
  }

  void _onCardCalsChanged(int index, int cals) {
    _calMap[index] = cals;
    _notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Meats",
          style: AppStyles.font16White.copyWith(
            color: AppColors.kAxisScrollViewTitle,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // 🔸 كارت 0
              CategoryCard(
                image: AppImages.meat1,
                name: 'Lean Beef',
                price: '12', // مثال سعر
                cal: '12 Cal', // نص يُعرَض فقط
                calPerUnit: 264, // ← سعرات الوحدة
                onQuantityChanged: (q) => _onCardQtyChanged(0, q),
                onCaloriesChanged: (c) => _onCardCalsChanged(0, c),
              ),
              const SizedBox(width: 12),

              // 🔸 كارت 1
              CategoryCard(
                image: AppImages.meat2,
                name: 'Salmon',
                price: '12',
                cal: '12 Cal',
                calPerUnit: 208,
                onQuantityChanged: (q) => _onCardQtyChanged(1, q),
                onCaloriesChanged: (c) => _onCardCalsChanged(1, c),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}
