import 'package:flutter/material.dart';

import '../../../../core/utils/assets/app_styles/app_styles.dart';
import '../../../../core/utils/assets/colors/app_colors.dart';

class SummaryItemNameAndCals extends StatelessWidget {
  const SummaryItemNameAndCals({
    super.key,
    required this.name,
    required this.cal,
  });
  final String name;
  final int cal;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Bell Pepper",
          style: AppStyles.font16WhiteRegular.copyWith(
            color: AppColors.kAxisScrollViewTitle,
          ),
        ),
        Text(
          "12 Cal",
          style: AppStyles.font16WhiteRegular.copyWith(
            color: AppColors.kLightGrey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
