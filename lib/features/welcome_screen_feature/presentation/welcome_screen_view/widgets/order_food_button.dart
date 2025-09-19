import 'package:balanced_meal/core/utils/assets/app_styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_primary_button.dart';

class OrderFoodButton extends StatelessWidget {
  const OrderFoodButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 709,
      left: 24,
      right: 24,
      child: PrimaryButton(
        text: "Order Food",
        width: 327,
        height: 60,
        rad: 12,
        onPressed: () {
          GoRouter.of(context).push("/EnterYourDetails");
        },
        style: AppStyles.font16White,
      ),
    );
  }
}
