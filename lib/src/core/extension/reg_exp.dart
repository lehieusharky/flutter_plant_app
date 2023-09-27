extension StringX on String {
  String getUserNameFromEmail() {
    List<String> parts = split("@");
    return parts.first;
  }
}
