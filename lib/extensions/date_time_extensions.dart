part of '../basic_flutter_helper.dart';

extension DateTimeExtensions on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day && tomorrow.month == month && tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }

  bool isDaysAfter(DateTime date) {
    if (year > date.year) return true;
    if (year == date.year && month > date.month) return true;
    if (year == date.year && month == date.month && day > date.day) return true;
    return false;
  }

  bool isDaysBefore(DateTime date) {
    if (year < date.year) return true;
    if (year == date.year && month < date.month) return true;
    if (year == date.year && month == date.month && day < date.day) return true;
    return false;
  }

  bool isSameDay(DateTime day2) => year == day2.year && month == day2.month && day == day2.day;

  bool isSameDayOrDaysAfter(DateTime day2) => isSameDay(day2) || isDaysAfter(day2);

  bool isSameDayOrDaysBefore(DateTime day2) => isSameDay(day2) || isDaysBefore(day2);

  DateTime get toBeginningOfTheDay => DateTime(year, month, day);

  DateTime get toBeginningOfTheMonth => DateTime(year, month).toBeginningOfTheDay;
}
