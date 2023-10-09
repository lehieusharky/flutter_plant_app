extension StringExt on String {
  String getUserNameFromEmail() {
    List<String> parts = split("@");
    return parts.first;
  }

  String convertCelsiusToFahrenheit(double celsius) {
    return ((celsius * 9 / 5) + 32).toString();
  }

  bool phoneNumberValidation({required String phoneNumber}) {
    RegExp regex = RegExp(r'^\d+$');
    return (regex.hasMatch(phoneNumber) &&
        phoneNumber.length > 8 &&
        phoneNumber.length < 11);
  }
}
