import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:balanced_meal/features/create_your_order_feature/view_model/firestore_services/write_on_firestore.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/next_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets/app_fonts/app_fonts.dart';
import '../../../../core/utils/assets/app_styles/app_styles.dart';
import '../../view_model/firestore_services/model.dart';

class PlaceOrderContainer extends StatelessWidget {
  const PlaceOrderContainer({
    super.key,
    required this.enabled,
    required this.currentCals,
    required this.maxCals,
    required this.totalPrice, // ✅ جديد
    required this.vegList, // ✅ تُمرَّر من CreateYourOrderView
    required this.meatList,
    required this.carbList,
    required this.buttonText,
  });

  final bool enabled;
  final int currentCals;
  final int maxCals;
  final double totalPrice;

  final String buttonText;

  // القوائم التي أنشأتها من الخرائط
  final List<OrderItem> vegList;
  final List<OrderItem> meatList;
  final List<OrderItem> carbList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhite,
      width: 375,
      height: 164,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: [
          /* السطر الأول: السعرات */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cals",
                style: TextStyle(
                  color: AppColors.kAxisScrollViewTitle,
                  fontSize: 15,
                  fontFamily: AppFonts.poppinsFontRegular,
                ),
              ),
              Text(
                "$currentCals Cal out of $maxCals Cal",
                style: TextStyle(
                  color: AppColors.kLightGrey,
                  fontSize: 14,
                  fontFamily: AppFonts.poppinsFontRegular,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /* السطر الثاني: السعر */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  color: AppColors.kAxisScrollViewTitle,
                  fontSize: 15,
                  fontFamily: AppFonts.poppinsFontRegular,
                ),
              ),
              Text(
                "\$${totalPrice.toStringAsFixed(2)}", // ✅ ديناميكي
                style: AppStyles.font16White.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /* زر Place Order */
          NextButton(
            enabled: enabled,
            onPressed: () async {
              GoRouter.of(context).push("/YourOrderSummary");
              if (!enabled) return;

              // 1) خزن الطلب في فايرستورد
              final user = FirebaseAuth.instance.currentUser;
              if (user == null) return; // غير مسجّل؟

              await WriteOnFirestore.saveOrderToFirestore(
                uid: user.uid,
                veg: vegList,
                meat: meatList,
                carbs: carbList,
                totalCals: currentCals,
                totalPrice: totalPrice,
              );
            },
            text: buttonText,
          ),
        ],
      ),
    );
  }
}
