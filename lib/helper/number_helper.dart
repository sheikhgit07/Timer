
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'age_helper.dart';

String getDate(String date,BuildContext context) {
  String createTime = '';
  DateTime time = DateTime.parse("${date}");
  AgeDuration age = Age.dateDifference(fromDate: time, toDate: DateTime.now(), includeToDate: true);

  int hourCompare = DateTime.now().hour - time.hour;
  int minuteCompare = DateTime.now().minute - time.minute;
  createTime = age.years > 0
      ? "${age.years}ye ago"
      : age.months > 0
          ? "${age.months}mo ago"
          : age.days > 0
              ? "${age.days}da ago"
              : hourCompare > 0
                  ? "${hourCompare}ho ago"
                  : "${minuteCompare}mi ago";

  return createTime;
}

String convertPriceRetString(double price, String sym) {
  return '${removeDecimalZeroFormat(price)} ${sym}';
}

String removeDecimalZeroFormat(double n) {
  var formatter = n.truncateToDouble() == n ? NumberFormat('###,###,###') : NumberFormat('###,###,###.00');
  return formatter.format(n);
}

String numberFormat(int n) {
  var formatter = n.truncateToDouble() == n ? NumberFormat('#,##,###') : NumberFormat('#,##,###');
  return formatter.format(n);
}

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }
  return double.tryParse(s) != null;
}
