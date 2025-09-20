import 'package:balanced_meal/core/utils/assets/colors/app_colors.dart';
import 'package:balanced_meal/core/widgets/custom_app_bar_shared.dart';
import 'package:balanced_meal/features/enter_your_details_feature/models/exchange_gender_value.dart';
import 'package:balanced_meal/features/enter_your_details_feature/models/exchange_user_data.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/gender_drop_down_button.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/next_button.dart';
import 'package:balanced_meal/features/enter_your_details_feature/presentation/widgets/shared_enter_column.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnterYourDetailsView extends StatefulWidget {
  const EnterYourDetailsView({super.key});

  @override
  State<EnterYourDetailsView> createState() => _EnterYourDetailsViewState();
}

class _EnterYourDetailsViewState extends State<EnterYourDetailsView> {
  final weightController = TextEditingController();

  final heightController = TextEditingController();

  final ageController = TextEditingController();

  bool get isFormValid =>
      ExchangeGenderValue.value.getGender != null &&
      weightController.text.isNotEmpty &&
      heightController.text.isNotEmpty &&
      ageController.text.isNotEmpty;

  ExchangeUserData pass = ExchangeUserData.obg;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBgScreens,
        appBar: AppBarShared(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          title: 'Enter Your Details',
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 31,
            left: 24,
            right: 24,
            bottom: 34,
          ),
          child: SingleChildScrollView(
            // lets the user drag to dismiss keyboard on iOS/Android
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenderDropDownButton(),
                SharedEnterColumn(
                  text: 'Weight',
                  textFieldHint: 'Enter your weight',
                  suffixText: 'Kg',
                  controller: weightController,
                  onChanged: (_) => setState(() {}),
                ),
                SharedEnterColumn(
                  text: 'Height',
                  textFieldHint: 'Enter your Height',
                  suffixText: 'Cm',
                  controller: heightController,
                  onChanged: (_) => setState(() {}),
                ),
                SharedEnterColumn(
                  text: 'Age',
                  textFieldHint: 'Enter your Age',
                  suffixText: '',
                  controller: ageController,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 169),
                NextButton(
                  enabled: isFormValid,
                  onPressed: () {
                    // 1) احضري القيم النصيّة
                    final gender = ExchangeGenderValue.value.getGender!;
                    final weightStr = weightController.text;
                    final heightStr = heightController.text;
                    final ageStr = ageController.text;

                    // 2) حوّليها إلى أرقام
                    final weight = double.tryParse(weightStr);
                    final height = double.tryParse(heightStr);
                    final age = int.tryParse(ageStr);
                    pass.setGender(gender);
                    pass.setAge(age!);
                    pass.setHeight(height!);
                    pass.setWeight(weight!);

                    // 3) تحقّق من التحويل (لتفادي الـ null أو الأحرف غير الصالحة)
                    if (weight == null || height == null || age == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter valid numeric values'),
                        ),
                      );
                      return;
                    }
                    GoRouter.of(context).push("/CreateYourOrder");
                  },
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
