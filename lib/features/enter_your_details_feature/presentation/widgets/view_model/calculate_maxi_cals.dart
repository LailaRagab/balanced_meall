import 'package:balanced_meal/features/enter_your_details_feature/models/exchange_user_data.dart';

class CalculateMaxiCals {
  ExchangeUserData pass = ExchangeUserData.obg;

  int calculateUserCals() {
    num weight = pass.getWeight!;
    num height = pass.getHeight!;
    num age = pass.getAge!;
    String? gender = pass.getGender;
    if (gender == 'female') {
      return (655.1 + 9.56 * weight + 1.85 * height - 4.67 * age).round();
    } else {
      return (666.47 + 13.75 * weight + 5 * height - 6.75 * age).round();
    }
  }
}
