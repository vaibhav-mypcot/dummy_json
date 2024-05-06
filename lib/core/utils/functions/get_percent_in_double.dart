import 'dart:developer';

double getPercentInDouble(String stringPercentWithSign) {
  double percent = double.parse(
      stringPercentWithSign.substring(0, stringPercentWithSign.length - 1));

  log('percent: $percent');

  if (percent == 100.0 || percent == 100) {
    percent = 99.99999;
  }

  return percent;
}
