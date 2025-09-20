import 'package:balanced_meal/core/utils/assets/app_styles/app_styles.dart';
import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/shared_enter_text.dart';
import 'package:flutter/material.dart';

class SharedEnterColumn extends StatelessWidget {
  const SharedEnterColumn({
    super.key,
    required this.text,
    required this.textFieldHint,
    required this.suffixText,
    required this.controller,
    required this.onChanged,
  });

  final String text;
  final String textFieldHint;
  final String suffixText;

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        SharedEnterText(text: text),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.kWhite,
            border: Border.all(color: AppColors.kBorderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hint: Text(textFieldHint),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  child: Text(
                    suffixText,
                    style: AppStyles.font16White.copyWith(
                      fontSize: 14,
                      color: AppColors.kBlack,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
