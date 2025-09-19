class ExchangeUserData {
  static ExchangeUserData obg = ExchangeUserData();
  String? gender;
  num? weight;
  num? height;
  num? age;

  String? get getGender => gender;

  void setGender(String value) {
    gender = value;
  }

  num? get getAge => age;

  void setAge(num value) {
    age = value;
  }

  num? get getHeight => height;

  void setHeight(num value) {
    height = value;
  }

  num? get getWeight => weight;

  void setWeight(num value) {
    weight = value;
  }
}
