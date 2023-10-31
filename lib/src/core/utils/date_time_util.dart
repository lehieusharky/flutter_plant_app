import 'package:intl/intl.dart';

class DateTimeUtil {
  static String yearMonthDayNow() {
    final dateTimeNow = DateTime.now();
    final dateTimeFormated = DateFormat('yyyy-MM-dd').format(dateTimeNow);

    return dateTimeFormated;
  }
}
