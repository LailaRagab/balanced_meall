import 'package:balanced_meal/core/utils/assets/app_fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/assets/app_styles/app_styles.dart';
import '../../../../core/utils/assets/colors/app_colors.dart';
import 'build_counter.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.cal, // نصّ يُعرَض فقط
    required this.calPerUnit, // ← سعرات كل وحدة
    required this.onQuantityChanged,
    required this.onCaloriesChanged,
  });

  final String image;
  final String name;
  final String price;
  final String cal;
  final int calPerUnit;

  /// 🔔 يُبلِّغ الأب بالكمية
  final ValueChanged<int> onQuantityChanged;

  /// 🔔 يُبلِّغ الأب بالسعرات الحالية (quantity × calPerUnit)
  final ValueChanged<int> onCaloriesChanged;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isAdded = false;
  int quantity = 0;

  /// 🔔 دالة واحدة تُرسل الكمية + السعرات
  void _notify() {
    widget.onQuantityChanged(quantity);
    widget.onCaloriesChanged(quantity * widget.calPerUnit);
  }

  void _increment() {
    setState(() => quantity++);
    _notify();
  }

  void _decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        quantity = 0;
        isAdded = false;
      }
    });
    _notify();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhite,
      width: 183,
      height: 196,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image(image: AssetImage(widget.image), height: 108),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  color: AppColors.kAxisScrollViewTitle,
                  fontSize: 15,
                  fontFamily: AppFonts.poppinsFontRegular,
                ),
              ),
              Text(
                widget.cal, // مثال: "12 cal"
                style: TextStyle(
                  color: AppColors.kLightGrey,
                  fontSize: 14,
                  fontFamily: AppFonts.poppinsFontRegular,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.price}",
                style: AppStyles.font16White.copyWith(
                  color: AppColors.kAxisScrollViewTitle,
                ),
              ),
              isAdded
                  ? BuildCounter(
                    quantity: quantity,
                    increment: _increment,
                    decrement: _decrement,
                  )
                  : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAdded = true;
                        quantity = 1;
                      });
                      _notify(); // 🔔 أول مرة يضيف فيها
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(100, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Add', style: AppStyles.font16WhiteRegular),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
