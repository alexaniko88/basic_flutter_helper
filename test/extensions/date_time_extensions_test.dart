import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Date time extensions test', () {

    /// daysInMonth

    test('Having provided date time Feb 2024 When daysInMonth is called Then return 29', () {
      final date = DateTime(2024, 2);
      expect(date.daysInMonth, 29);
    });

    test('Having provided date time Dic 2024 When daysInMonth is called Then return 31', () {
      final date = DateTime(2024, 12);
      expect(date.daysInMonth, 31);
    });

    test('Having provided date time Ene 2024 When daysInMonth is called Then return 31', () {
      final date = DateTime(2024, 1);
      expect(date.daysInMonth, 31);
    });

    /// isToday

    test('Having provided date When isToday is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      expect(date.isToday, false);
    });

    test('Having provided date When isToday is called Then return true', () {
      final date = DateTime.now();
      expect(date.isToday, true);
    });

    /// isTomorrow

    test('Having provided date When isTomorrow is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      expect(date.isTomorrow, false);
    });

    test('Having provided date When isTomorrow is called Then return true', () {
      final date = DateTime.now().add(const Duration(days: 1));
      expect(date.isTomorrow, true);
    });

    test('Having provided date When isTomorrow is called Then return false as is more than 1 day', () {
      final date = DateTime.now().add(const Duration(days: 5));
      expect(date.isTomorrow, false);
    });

    /// isYesterday

    test('Having provided date When isYesterday is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      expect(date.isYesterday, false);
    });

    test('Having provided date When isYesterday is called Then return true', () {
      final date = DateTime.now().subtract(const Duration(days: 1));
      expect(date.isYesterday, true);
    });

    test('Having provided date When isYesterday is called Then return false as is more than 1 day', () {
      final date = DateTime.now().subtract(const Duration(days: 4));
      expect(date.isYesterday, false);
    });

    /// isDaysAfter

    test('Having provided date and date to compare When isDaysAfter is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isDaysAfter(dateToCompare), false);
    });

    test('Having provided date as date to compare + 1 day and date to compare When isDaysAfter is called Then return true', () {
      final date = DateTime(2023, 1, 2);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isDaysAfter(dateToCompare), true);
    });

    test('Having provided date as date to compare + 1 month and date to compare When isDaysAfter is called Then return true', () {
      final date = DateTime(2023, 2, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isDaysAfter(dateToCompare), true);
    });

    test('Having provided date as date to compare - 10 days and date to compare When isDaysAfter is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 11);
      expect(date.isDaysAfter(dateToCompare), false);
    });

    /// isDaysBefore

    test('Having provided date and date to compare When isDaysBefore is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isDaysBefore(dateToCompare), false);
    });

    test('Having provided date as date to compare + 1 day and date to compare When isDaysBefore is called Then return false', () {
      final date = DateTime(2023, 1, 2);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isDaysBefore(dateToCompare), false);
    });

    test('Having provided date as date to compare + 1 month and date to compare When isDaysBefore is called Then return false', () {
      final date = DateTime(2023, 2, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isDaysBefore(dateToCompare), false);
    });

    test('Having provided date as date to compare - 10 days and date to compare When isDaysBefore is called Then return true', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 11);
      expect(date.isDaysBefore(dateToCompare), true);
    });

    /// isSameDay

    test('Having provided date and date to compare When isSameDay is called Then return true', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDay(dateToCompare), true);
    });

    test('Having provided date as date to compare + 1 day and date to compare When isSameDay is called Then return false', () {
      final date = DateTime(2023, 1, 2);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDay(dateToCompare), false);
    });

    test('Having provided date as date to compare - 10 days and date to compare When isSameDay is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 11);
      expect(date.isSameDay(dateToCompare), false);
    });

    /// isSameDayOrDaysAfter

    test('Having provided date and date to compare When isSameDayOrDaysAfter is called Then return true', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDayOrDaysAfter(dateToCompare), true);
    });

    test('Having provided date as date to compare + 1 day and date to compare When isSameDayOrDaysAfter is called Then return true', () {
      final date = DateTime(2023, 1, 2);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDayOrDaysAfter(dateToCompare), true);
    });

    test('Having provided date as date to compare + 1 month and date to compare When isSameDayOrDaysAfter is called Then return true', () {
      final date = DateTime(2023, 2, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDayOrDaysAfter(dateToCompare), true);
    });

    test('Having provided date as date to compare - 10 days and date to compare When isSameDayOrDaysAfter is called Then return false', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 11);
      expect(date.isSameDayOrDaysAfter(dateToCompare), false);
    });

    /// isSameDayOrDaysBefore

    test('Having provided date and date to compare When isSameDayOrDaysBefore is called Then return true', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDayOrDaysBefore(dateToCompare), true);
    });

    test('Having provided date as date to compare + 1 day and date to compare When isSameDayOrDaysBefore is called Then return false', () {
      final date = DateTime(2023, 1, 2);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDayOrDaysBefore(dateToCompare), false);
    });

    test('Having provided date as date to compare + 1 month and date to compare When isSameDayOrDaysBefore is called Then return false', () {
      final date = DateTime(2023, 2, 1);
      final dateToCompare = DateTime(2023, 1, 1);
      expect(date.isSameDayOrDaysBefore(dateToCompare), false);
    });

    test('Having provided date as date to compare - 10 days and date to compare When isSameDayOrDaysBefore is called Then return true', () {
      final date = DateTime(2023, 1, 1);
      final dateToCompare = DateTime(2023, 1, 11);
      expect(date.isSameDayOrDaysBefore(dateToCompare), true);
    });

    /// toBeginningOfTheDay

    test('Having provided date When toBeginningOfTheDay is called Then return the date shifted to beginning of the day', () {
      final date = DateTime(2023, 1, 1, 12, 45);
      expect(date.toBeginningOfTheDay, DateTime(2023, 1, 1, 0, 0));
    });

    /// toBeginningOfTheMonth

    test('Having provided date When toBeginningOfTheMonth is called Then return the date shifted to beginning of the month', () {
      final date = DateTime(2023, 1, 12, 12, 45);
      expect(date.toBeginningOfTheMonth, DateTime(2023, 1, 1, 0, 0));
    });
  });
}
