import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:balanced_meal/core/widgets/custom_app_bar_shared.dart';
import 'package:balanced_meal/features/create_your_order_feature/presentation/widgets/place_order_container.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/view_model/calculate_maxi_cals.dart';
import 'package:balanced_meal/features/your_order_summary_feature/presentation/widgets/summary_of_order_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:balanced_meal/core/utils/assets/images/app_images.dart';

class YourOrderSummaryView extends StatefulWidget {
  const YourOrderSummaryView({super.key});

  @override
  State<YourOrderSummaryView> createState() => _YourOrderSummaryViewState();
}

class _YourOrderSummaryViewState extends State<YourOrderSummaryView> {
  int totalItems = 0;
  int currentCals = 0;
  int totalPrice = 0;

  List<Map<String, dynamic>> vegList = [];
  List<Map<String, dynamic>> meatList = [];
  List<Map<String, dynamic>> carbList = [];

  void _updateSummary({
    required int totalCals,
    required int price,
    required List<Map<String, dynamic>> veg,
    required List<Map<String, dynamic>> meat,
    required List<Map<String, dynamic>> carbs,
  }) {
    setState(() {
      currentCals = totalCals;
      totalPrice = price;
      vegList = veg;
      meatList = meat;
      carbList = carbs;
      totalItems = veg.length + meat.length + carbs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBgScreens,
        appBar: AppBarShared(
          onPressed: () => context.pop(),
          title: 'Order summary',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 👉 فى نسخة الإنتاج بَنِى هذه القائمة ديناميكيًّا من حالة التطبيق
                SummaryOfOrderCard(
                  name: 'Bell Pepper',
                  calPerUnit: 12,
                  pricePerUnit: 12,
                  imagePath: AppImages.vegetableOne,
                  onSummaryChanged:
                      ({required items, required price, required totalCals}) {},
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: PlaceOrderContainer(
            enabled: true,
            currentCals: currentCals,
            maxCals: CalculateMaxiCals().calculateUserCals(),
            totalPrice: totalPrice.toDouble(),
            vegList: [],
            meatList: [],
            carbList: [],
            buttonText: 'Confirm',
          ),
        ),
      ),
    );
  }
}
