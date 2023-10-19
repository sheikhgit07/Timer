import 'package:intl/intl.dart';

class DateDetails {
  final int week;
  final String dayOfWeek;
  final String month;
  final int year;

  DateDetails(
      {required this.week,
      required this.dayOfWeek,
      required this.month,
      required this.year});
}

DateDetails getDateDetails(DateTime date) {
  int daysPassed = date.difference(DateTime(date.year, 1, 1)).inDays;
  int weekNumber = (daysPassed / 7).ceil() + 1;

  String dayOfWeek =
      DateFormat('EEEE').format(date); // Format to get day of the week

  String month = DateFormat('MMMM').format(date);

  return DateDetails(
      week: weekNumber, dayOfWeek: dayOfWeek, month: month, year: date.year);
}

String removeAmPmFromTime(String inputTime) {
  DateTime parsedTime = DateFormat('hh:mm a').parse(inputTime);
  String formattedTime = DateFormat('hh:mm').format(parsedTime);
  return formattedTime;
}
