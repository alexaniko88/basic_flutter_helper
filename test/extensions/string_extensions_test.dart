import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String extensions test', () {

    /// orEmpty

    test('Having provided null string When orEmpty is called Then return empty string', () {
      String? test;
      expect(test.orEmpty, '');
    });

    test('Having provided string When orEmpty is called Then return the string', () {
      String test = 'test';
      expect(test.orEmpty, 'test');
    });

    /// isNullOrEmpty

    test('Having provided null string When isNullOrEmpty is called Then return true', () {
      String? test;
      expect(test.isNullOrEmpty, true);
    });

    test('Having provided empty string with spaces When isNullOrEmpty is called Then return true', () {
      String test = '   ';
      expect(test.isNullOrEmpty, true);
    });

    test('Having provided empty string When isNullOrEmpty is called Then return true', () {
      String test = '';
      expect(test.isNullOrEmpty, true);
    });

    test('Having provided string When isNullOrEmpty is called Then return false', () {
      String test = 'string';
      expect(test.isNullOrEmpty, false);
    });

    /// isNotNullAndNotEmpty

    test('Having provided null string When isNotNullAndNotEmpty is called Then return false', () {
      String? test;
      expect(test.isNotNullAndNotEmpty, false);
    });

    test('Having provided empty string with spaces When isNotNullAndNotEmpty is called Then return false', () {
      String test = '   ';
      expect(test.isNotNullAndNotEmpty, false);
    });

    test('Having provided empty string When isNotNullAndNotEmpty is called Then return false', () {
      String test = '';
      expect(test.isNotNullAndNotEmpty, false);
    });

    test('Having provided string When isNotNullAndNotEmpty is called Then return true', () {
      String test = 'string';
      expect(test.isNotNullAndNotEmpty, true);
    });

    /// asCapitalized

    test('Having provided null string When asCapitalized is called Then return the same null string', () {
      String? test;
      expect(test.asCapitalized, test);
    });

    test('Having provided string with empty spaces When asCapitalized is called Then return the same empty string', () {
      String test = '     ';
      expect(test.asCapitalized, test);
    });

    test('Having provided empty string When asCapitalized is called Then return the same empty string', () {
      String test = '';
      expect(test.asCapitalized, test);
    });

    test('Having provided string When asCapitalized is called Then return the capitalized string', () {
      String test = 'string';
      expect(test.asCapitalized, 'String');
    });

    test('Having provided nullable string but with value When asCapitalized is called Then return the string with capitalized value', () {
      String? test = "test";
      expect(test.asCapitalized, "Test");
    });

    /// asCapitalizeByWord

    test('Having provided string with empty spaces When asCapitalizeByWord is called Then return the same empty string', () {
      String test = '     ';
      expect(test.asCapitalizeByWord, test);
    });

    test('Having provided empty string When asCapitalizeByWord is called Then return the same empty string', () {
      String test = '';
      expect(test.asCapitalizeByWord, test);
    });

    test('Having provided string When asCapitalizeByWord is called Then return the capitalized string', () {
      String test = 'string and another string';
      expect(test.asCapitalizeByWord, 'String And Another String');
    });

    test('Having provided nullable string but with value When asCapitalizeByWord is called Then return the string with capitalized value', () {
      String? test = "test and another test";
      expect(test.asCapitalizeByWord, "Test And Another Test");
    });
  });
}
