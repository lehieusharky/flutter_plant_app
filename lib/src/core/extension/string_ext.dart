import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';

extension StringExt on String {
  String getUserNameFromEmail() {
    List<String> parts = split("@");
    return parts.first;
  }

  String convertCelsiusToFahrenheit(double celsius) {
    return ((celsius * 9 / 5) + 32).toString();
  }

  bool isValidPhoneNumber() {
    RegExp regex = RegExp(r'^\d+$');
    return (regex.hasMatch(this) && length > 9 && length <= 11);
  }

  String? errorPhoneValidation(BuildContext context) {
    return isValidPhoneNumber()
        ? null
        : translate(context).phoneNumberMustBe811DigitsLong;
  }
}
