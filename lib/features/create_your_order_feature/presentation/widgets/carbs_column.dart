import 'package:flutter/material.dart';
import '../../../../core/utils/assets/app_styles/app_styles.dart';
import '../../../../core/utils/assets/colors/app_colors.dart';
import '../../../../core/utils/assets/images/app_images.dart';
import 'category_card.dart';

class CarbsColumn extends StatefulWidget {
  const CarbsColumn({
    super.key,
    required this.onTotalChanged,
    required this.onCalsChanged,
  });

  final ValueChanged<int> onTotalChanged; // إجمالي كمّيّات الكربوهيدرات
  final ValueChanged<int> onCalsChanged; // إجمالي سعراتها

  @override
  State<CarbsColumn> createState() => _CarbsColumnState();
}

class _CarbsColumnState extends State<CarbsColumn> {
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
          "Carbs",
          style: AppStyles.font16White.copyWith(
            color: AppColors.kAxisScrollViewTitle,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),

        /// شريط الكروت الأفقي
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // 🔸 كارت 0
              CategoryCard(
                image: AppImages.carbon1,
                name: 'Sweat Corn',
                price: '12',
                cal: '12 Cal',
                calPerUnit: 150,
                onQuantityChanged: (q) => _onCardQtyChanged(0, q),
                onCaloriesChanged: (c) => _onCardCalsChanged(0, c),
              ),
              const SizedBox(width: 12),

              // 🔸 كارت 1
              CategoryCard(
                image: AppImages.carbon2,
                name: 'Brown Rice',
                price: '12',
                cal: '12 Cal',
                calPerUnit: 174,
                onQuantityChanged: (q) => _onCardQtyChanged(1, q),
                onCaloriesChanged: (c) => _onCardCalsChanged(1, c),
              ),
              const SizedBox(width: 12),

              // أضف كروتًا إضافية بنفس الأسلوب مع index = 2,3,...
            ],
          ),
        ),
      ],
    );
  }
}
