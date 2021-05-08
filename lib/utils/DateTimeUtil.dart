import 'package:flutter/cupertino.dart';

class DateTimeUtil {
  static bool isMatchToday({@required DateTime matchDate}) {
    final DateTime now = DateTime.now();

    return now.year == matchDate.year &&
        now.month == matchDate.month &&
        now.day == matchDate.day;
  }
}
