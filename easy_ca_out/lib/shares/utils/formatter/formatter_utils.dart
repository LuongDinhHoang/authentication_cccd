import 'dart:convert';

import '../../shares.src.dart';

String formatNumber(num? number, int length) {
  number ??= 0;
  String invoiceNo = number.toInt().toString();

  final int count = length - invoiceNo.length;

  for (int index = 0; index < count; index++) {
    invoiceNo = '0$invoiceNo';
  }
  return invoiceNo;
}

String formatHourNo(int number) {
  return formatNumber(number, 2);
}

String twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String formatBySeconds(Duration duration) =>
    twoDigits(duration.inSeconds.remainder(60));

String formatByMinutes(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return '$twoDigitMinutes:${formatBySeconds(duration)}';
}

String formatByHours(Duration duration) {
  return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
}

String encodePasswordIssueInv(String password) {
  return base64Encode(utf8.encode(password));
}

String decodePasswordIssueInv(String password) {
  return utf8.decode(base64Decode(password));
}

int getDefaultIdOff(int? id) {
  return id ?? 0;
}

String getDefaultFormatCurrency({bool? isDot}) {
  isDot ??= CurrencyUtils.isDotCurrency;
  return isDot ? '.' : ',';
}

String getDoubleDefaultFormatCurrency({bool? isDot}) {
  isDot ??= CurrencyUtils.isDotCurrency;
  return isDot ? '..' : ',,';
}
