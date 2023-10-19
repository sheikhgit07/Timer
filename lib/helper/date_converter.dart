import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(String dateTime) {
    // return DateFormat('yyyy-MM-dd').format(dateTime);
    return DateFormat('yyyy-MM-dd').format(DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime));
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }
  static DateTime isoStringToLocalTime(String dateTime) {
    return DateFormat('hh:mm:ss').parse(dateTime);
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('hh:mm:ss').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('hh:mm').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd/MM/yyyy').format(isoStringToLocalDate(dateTime));
  }
  static String isoStringToLocalDate2Only(String dateTime) {
    return DateFormat('dd MM yyyy').format(isoStringToLocalDate(dateTime));
  }
  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm a').format(dateTime.toUtc());
  }

  static String localDateToString(String dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm a').format(DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime));
  }

  static String convertTimeToTime(String time) {
    return DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(time));
  }

  static DateTime isoStringToLocalDateNew(String dateTime) {
    return DateFormat('yyyy-MM-dd').parse(dateTime, true).toLocal();
  }
  static String isoStringToLocalDateOnly3(String dateTime) {
    return DateFormat('dd/MM/yyyy').format(isoStringToLocalDateNew(dateTime));
  }
}
