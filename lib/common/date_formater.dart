import 'package:intl/intl.dart';

String formatDate(DateTime inputDate) {
  return DateFormat.yMMMMd().add_jm().format(inputDate.toLocal());
}

String formatDateWithoutTime(DateTime inputDate) {
  return DateFormat.yMMMMd().format(inputDate.toLocal());
}

String formatDateWithoutTimeDay(DateTime inputDate) {
  return DateFormat.yMMMM().format(inputDate.toLocal());
}

String formatDateWithYear(DateTime inputDate) {
  return DateFormat.y().format(inputDate.toLocal());
}

String formatTime(DateTime inputDate) {
  return DateFormat.jm().format(inputDate.toLocal());
}

int daysBetween(DateTime? from, DateTime? to) {
  from = DateTime(from!.year, from.month, from.day);
  to = DateTime(to!.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

secondToHourMin(int second) {
  final hour = second ~/ 3600;
  final min = (second % 3600) ~/ 60;
  return '$hour hr $min min';
}
