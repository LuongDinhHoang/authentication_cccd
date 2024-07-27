import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String pattern1 = "dd/MM/yyyy";
const String patternDd = "dd";
const String patternMm = "MM";
const String patternY = "yy";
const String patternYy = "yyyy";
const String pattern2 = "dd/MM";
const String pattern3 = "yyyy-MM-dd'T'HHmmss";
const String pattern4 = "h:mm a dd/MM";
const String pattern5 = "yyyy-MM-dd HH:mm:ss";
const String pattern6 = "dd/MM/yyyy HH:mm";
const String pattern7 = "HH:mm dd/MM/yyyy";
const String pattern8 = "yyyy-MM-dd'T'HH:mm:ss";
const String pattern9 = "HH:mm - dd/MM/yyyy";
const String pattern10 = "dd/MM/yyyy HH:mm:ss";
const String pattern11 = "MM/yyyy";
const String pattern13 = "HH:mm";
const String pattern12 = "HH:mm:ss";
const String patternDefault = "yyyy-MM-dd";
const String pattern14 = "dd-MM-yyyy";
const String pattern15 = "yyyy-MM-dd";
const String pattern16 = "MM/yyyy";
const String pattern17 = "MMyyyy";
const String pattern18 = "yyyy-MM-dd HH:mm:ss.SSS'Z'";
const String pattern19 = "yyyy-MM-dd HH:mm:ss:SSS";
const String pattern20 = "yyyy-MM-dd HH:mm:ss.";
const String pattern21 = "ddMMyyyy";
const String pattern22 = "HH:mm:ss dd/MM/yyyy";
const String pattern23 = "yyMMdd";
const String pattern24 = "yyyy/MM/dd HH:mm:ss";


String formatDateTimeToString(DateTime dateTime) {
  return DateFormat(pattern1).format(dateTime);
}

String convertDateToStringVN({DateTime? dateTime}) {
  return DateFormat.yMMMMEEEEd("vi").format(dateTime ?? DateTime.now());
}

String convertDateToStringMonthYear({DateTime? dateTime}) {
  return DateFormat.yMMMM("vi")
      .format(dateTime ?? DateTime.now())
      .replaceAll("t", "T");
}

int? convertDMYToTimeStamps(String dateTimeStr, {String pattern = pattern1}) {
  if (dateTimeStr.isNotEmpty) {
    DateTime? dateTime = convertStringToDate(dateTimeStr, pattern);
    return dateTime!.millisecondsSinceEpoch;
  }
  return 0;
}

String convertDateToString(DateTime? dateTime, String pattern) {
  // dateTime ??= DateTime.now();
  if (dateTime == null) {
    return "";
  } else {
    return DateFormat(pattern).format(dateTime);
  }
}

String differentDate(DateTime? dateTime) {
  if (dateTime == null) {
    return "";
  } else {
    return dateTime.difference(DateTime.now()).inDays.toString();
  }
}

DateTime? convertStringToDate(String? dateTime, String pattern) {
  if (dateTime == null || dateTime == "") {
    return null;
  } else {
    return DateFormat(pattern).parse(dateTime);
  }
}

DateTime? convertDateToDate(DateTime? dateTime, String pattern) {
  if (dateTime == null) {
    return null;
  } else {
    return convertStringToDate(convertDateToString(dateTime, pattern), pattern);
  }
}

String convertDateToStringDefault(DateTime dateTime) {
  return DateFormat(patternDefault).format(dateTime);
}

String changeDateString(String date, {String pattern = pattern1}) {
  date = date.replaceAll('/', '');
  date = DateFormat(pattern).format(DateTime.parse(date));
  return date;
}

int getQuarter(DateTime date) {
  return (date.month + 2) ~/ 3;
}

int convertHourToInt(String dateTime) {
  return int.tryParse(dateTime.replaceAll(":", '').replaceAll(" ", "")) ?? 0;
}

String convertZtoS(DateTime date) {
  final inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'");
  final outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
  final inputDate = inputFormat.parse(date.toString());
  final outputDateString = outputFormat.format(inputDate);
  return outputDateString;
}

///Tính toán  các giá trị ngày giờ làm đêm và ngày mốc làm ngày 6h-22h đêm 22h-6h

double totalMorningTime(TimeOfDay startTime, TimeOfDay endTime) {
  double time = 0.0;
  if (startTime.hour <= 22 && endTime.hour > startTime.hour) {
    time = toDouble(replacingTimeOfDay(
        startTime.hour >= 6 ? startTime : const TimeOfDay(hour: 6, minute: 0),
        endTime.hour >= 22 || endTime.hour <= 6
            ? const TimeOfDay(hour: 22, minute: 0)
            : endTime));
  } else if (endTime.hour < startTime.hour && startTime.hour >= 6) {
    time = 16.0 - toDouble(replacingTimeOfDay(endTime, startTime));
  }
  return time;
}

double totalNightTime(TimeOfDay startTime, TimeOfDay endTime) {
  double time = 0.0;
  if (startTime.hour <= 6 ||
      endTime.hour <= 6 ||
      endTime.hour > 22 ||
      startTime.hour >= 22 ||
      (endTime.hour == 10 && endTime.minute > 0)) {
    if (startTime.hour <= 6 && endTime.hour <= 6) {
      time = toDouble(replacingTimeOfDay(startTime, endTime));
    } else if (startTime.hour <= 22 && endTime.hour >= 6) {
      /*if ((startTime.hour < 6 ||
              startTime.hour == 6 && startTime.minute == 0) &&
          endTime.hour >= 22) {
        time = toDouble(replacingTimeOfDay(startTime, endTime));
      } else*/
      if ((startTime.hour < 6 ||
              startTime.hour == 6 && startTime.minute == 0) &&
          endTime.hour < 22) {
        time = toDouble(
            replacingTimeOfDay(startTime, const TimeOfDay(hour: 6, minute: 0)));
      } else if (startTime.hour >= 6 &&
          (endTime.hour > 22 ||
              (startTime.hour == 22 && startTime.minute == 0))) {
        time = toDouble(
            replacingTimeOfDay(const TimeOfDay(hour: 22, minute: 0), endTime));
      } else if ((startTime.hour < 6 ||
              (startTime.hour == 6 && startTime.minute == 0)) &&
          (endTime.hour > 22 ||
              (startTime.hour == 22 && startTime.minute == 0))) {
        time = toDouble(replacingTimeOfDay(
                const TimeOfDay(hour: 22, minute: 0), endTime)) +
            toDouble(replacingTimeOfDay(
                startTime, const TimeOfDay(hour: 6, minute: 0)));
      }
    } else if (startTime.hour >= 6 && endTime.hour <= 6) {
      time = toDouble(replacingTimeOfDay(
          startTime.hour >= 22
              ? startTime
              : const TimeOfDay(hour: 22, minute: 0),
          endTime));
    } else if (startTime.hour <= 6 && endTime.hour >= 22) {
      time = toDouble(replacingTimeOfDay(
              startTime, const TimeOfDay(hour: 22, minute: 0))) +
          toDouble(replacingTimeOfDay(
              const TimeOfDay(hour: 22, minute: 0), endTime));
    } else if (startTime.hour >= 22 && endTime.hour >= 22) {
      time = toDouble(replacingTimeOfDay(startTime, endTime));
    } else if (startTime.hour >= 22 && endTime.hour <= 22) {
      time = toDouble(replacingTimeOfDay(startTime,
          endTime.hour <= 6 ? endTime : const TimeOfDay(hour: 6, minute: 0)));
    }
  } else if (endTime.hour < startTime.hour && startTime.hour >= 6) {
    time = toDouble(replacingTimeOfDay(const TimeOfDay(hour: 22, minute: 0),
        const TimeOfDay(hour: 6, minute: 0)));
  }
  return time;
}

double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

TimeOfDay replacingTimeOfDay(TimeOfDay startTime, TimeOfDay endTime) {
  final now = DateTime.now();
  DateTime dateEnd =
      DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);
  DateTime date = dateEnd
      .subtract(Duration(hours: startTime.hour, minutes: startTime.minute));
  return TimeOfDay.fromDateTime(date);
}

TimeOfDay convertTimeOfDay(String time) {
  TimeOfDay timeConvert = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]));
  return timeConvert;
}

int getDaysInMonth(String dateString) {
  List<String> dateParts = dateString.split("/");
  int month = int.tryParse(dateParts[0]) ?? 1;
  int year = int.tryParse(dateParts[1]) ?? 2023;

  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);
  int daysInMonth = firstDayOfNextMonth.difference(firstDayOfMonth).inDays;

  return daysInMonth;
}

int calculateDateDifference(String fromDate, String toDate) {
  if (fromDate != "" || toDate != "") {
    // Chuyển đổi chuỗi ngày thành đối tượng DateTime
    DateTime fromDateObj = DateTime.parse(convertDateFormat(fromDate));
    DateTime toDateObj = DateTime.parse(convertDateFormat(toDate));

    // Tính hiệu của hai đối tượng DateTime và lấy giá trị tuyệt đối
    // Duration difference = toDateObj.difference(fromDateObj);

    return (toDateObj.difference(fromDateObj).inHours / 24).round() + 1;
  } else {
    return 1;
  }
}

String convertDateFormat(String originalDate) {
  // Tách ngày, tháng và năm từ chuỗi ban đầu
  List<String> dateParts = originalDate.split('/');
  String day = dateParts[0];
  String month = dateParts[1];
  String year = dateParts[2];

  // Kết hợp lại theo định dạng "yyyy-MM-dd"
  String formattedDate = '$year-$month-$day';

  return formattedDate;
}

DateTime limitedTime() {
  return DateTime(DateTime.now().year + 2, 12, 31);
}

String? convertDateToStringTimeZone(DateTime? dateTime, String pattern) {
  if (dateTime == null) {
    return null;
  } else {
    String strDateTime = convertDateToString(dateTime, pattern);
    String timeZoneStr = "${dateTime.timeZoneName}:00";
    return "$strDateTime $timeZoneStr";
  }
}
