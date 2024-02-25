import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Num extension tests', () {

    test('Having 10 When microseconds is called Then returns duration as 10 microseconds', () {
      expect(10.microseconds, const Duration(microseconds: 10));
    });

    test('Having 10 When ms is called Then returns duration as 10 milliseconds', () {
      expect(10.ms, const Duration(milliseconds: 10));
    });

    test('Having 10 When seconds is called Then returns duration as 10 seconds', () {
      expect(10.sec, const Duration(seconds: 10));
    });

    test('Having 10 When minutes is called Then returns duration as 10 minutes', () {
      expect(10.min, const Duration(minutes: 10));
    });

    test('Having 10 When hours is called Then returns duration as 10 hours', () {
      expect(10.hrs, const Duration(hours: 10));
    });

    test('Having 10 When days is called Then returns duration as 10 days', () {
      expect(10.dd, const Duration(days: 10));
    });
  });
}
