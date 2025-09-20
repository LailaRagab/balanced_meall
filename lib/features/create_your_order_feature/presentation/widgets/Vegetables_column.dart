import 'package:flutter/material.dart';
import 'package:balanced_meal/core/utils/assets/images/app_images.dart';
import '../../../../core/utils/assets/app_styles/app_styles.dart';
import '../../../../core/utils/assets/colors/app_colors.dart';
import 'category_card.dart';

class VegetablesColumn extends StatefulWidget {
  const VegetablesColumn({
    super.key,
    required this.onTotalChanged,
    required this.onCalsChanged,
  });

  final ValueChanged<int> onTotalChanged; // يجمع كميّات الخضار
  final ValueChanged<int> onCalsChanged; // يجمع سعرات الخضار
  @override
  State<VegetablesColumn> createState() => _VegetablesColumnState();
}

class _VegetablesColumnState extends State<VegetablesColumn> {
  /// سجلات الكروت: index → quantity
  final Map<int, int> _qtyMap = {};

  /// سجلات الكروت: index → calories
  final Map<int, int> _calMap = {};

  // يعيد حساب الإجماليات ويبلِّغ الأب
  void _notifyParent() {
    final totalQty = _qtyMap.values.fold<int>(0, (s, e) => s + e);
    final totalCals = _calMap.values.fold<int>(0, (s, e) => s + e);
    widget.onTotalChanged(totalQty);
    widget.onCalsChanged(totalCals);
  }

  // يُستدعى من كل كارت عند تغيّر الكمّيّة
  void _onCardQtyChanged(int index, int q) {
    _qtyMap[index] = q;
    _notifyParent();
  }

  // يُستدعى من كل كارت عند تغيّر السعرات
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
          "Vegetables",
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
              CategoryCard(
                image: AppImages.vegetableOne,
                name: 'Bell Pepper',
                price: '12',
                cal: '12 Cal',
                calPerUnit: 12,
                onQuantityChanged: (q) => _onCardQtyChanged(0, q),
                onCaloriesChanged: (c) => _onCardCalsChanged(0, c),
              ),
              const SizedBox(width: 12),
              CategoryCard(
                image: AppImages.vegetableTwo,
                name: 'Carrot',
                price: '12',
                cal: '12 Cal',
                calPerUnit: 12,
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
