import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets/app_fonts/app_fonts.dart';
import '../../../../core/utils/assets/app_styles/app_styles.dart';

class PlaceOrderContainer extends StatelessWidget {
  const PlaceOrderContainer({
    super.key,
    required this.enabled,
    required this.buttonText,
  });
  final bool enabled;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhite,
      width: 375,
      height: 164,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: [
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
                "1198 Cal out of 1200 Cal",
                style: TextStyle(
                  color: AppColors.kLightGrey,
                  fontSize: 14,
                  fontFamily: AppFonts.poppinsFontRegular,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
                "\$125", // ✅ ديناميكي
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
            },
            text: buttonText,
          ),
        ],
      ),
    );
  }
}
