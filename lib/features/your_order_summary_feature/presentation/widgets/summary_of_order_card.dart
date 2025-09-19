import 'package:flutter/material.dart';
import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:balanced_meal/features/your_order_summary_feature/presentation/widgets/summary_item_name_and_cals.dart';
import 'package:balanced_meal/features/your_order_summary_feature/presentation/widgets/summary_item_price_and_counter.dart';

class SummaryOfOrderCard extends StatefulWidget {
  const SummaryOfOrderCard({
    super.key,
    required this.name,
    required this.calPerUnit,
    required this.pricePerUnit,
    required this.imagePath,
    required this.onSummaryChanged,
  });

  final String name;
  final int calPerUnit;
  final int pricePerUnit;
  final String imagePath;

  /// callback المبسَّط
  final void Function({
    required List<Map<String, dynamic>> items,
    required int price,
    required int totalCals,
  })?
  onSummaryChanged;

  @override
  State<SummaryOfOrderCard> createState() => _SummaryOfOrderCardState();
}

class _SummaryOfOrderCardState extends State<SummaryOfOrderCard> {
  int quantity = 0;

  void handleChange(int q) {
    setState(() => quantity = q);

    final int totalCals = quantity * widget.calPerUnit;
    final int totalPrice = quantity * widget.pricePerUnit;

    final items = [
      {
        "name": widget.name,
        "quantity": quantity,
        "calories": totalCals,
        "price": totalPrice,
      },
    ];

    widget.onSummaryChanged?.call(
      totalCals: totalCals,
      price: totalPrice,
      items: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      width: 327,
      height: 78,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Image.asset(
              widget.imagePath,
              height: 62,
              width: 76,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SummaryItemNameAndCals(
                    name: widget.name,
                    cal: widget.calPerUnit,
                  ),
                  SummaryItemPriceAndCounter(
                    onQuantityChanged: handleChange,
                    pricePerUnit: widget.pricePerUnit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
