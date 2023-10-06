extension StringExt on String {
  String getUserNameFromEmail() {
    List<String> parts = split("@");
    return parts.first;
  }

  String convertCelsiusToFahrenheit(double celsius) {
    return ((celsius * 9 / 5) + 32).toString();
  }
}
