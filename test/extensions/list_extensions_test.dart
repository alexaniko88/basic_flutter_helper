import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('List extension tests', () {
    /// isNullOrEmpty

    test('Having provided list as null When isNullOrEmpty is called Then returns true for null list', () {
      List<int>? list;
      expect(list.isNullOrEmpty, true);
    });

    test('Having provided list as empty When isNullOrEmpty is called Then returns true for empty list', () {
      List<int> list = [];
      expect(list.isNullOrEmpty, true);
    });

    test('Having provided list as filled When isNullOrEmpty is called Then returns false for non-empty list', () {
      List<int> list = [1, 2, 3];
      expect(list.isNullOrEmpty, false);
    });

    /// safeList

    test('Having provided list as null When safeList is called Then returns empty list', () {
      List<int>? list;
      expect(list.safeList(), []);
    });

    test('Having provided list as filled with one null When safeList is called Then returns list without null', () {
      List<int?> list = [1, null, 2];
      expect(list.safeList(), [1, 2]);
    });

    test('Having provided list as filled When safeList is called Then returns the initial list', () {
      List<int> list = [1, 2, 3];
      expect(list.safeList(), [1, 2, 3]);
    });

    /// addSafely

    test(
        'Having provided list and null item to add When addSafely is called Then returns initial list without adding the null',
        () {
      List<int> list = [1, 2];
      list.addSafely(null);
      expect(list, [1, 2]);
    });

    test('Having provided list and item to add When addSafely is called Then returns the updated list with new element',
        () {
      List<int> list = [1, 2];
      list.addSafely(3);
      expect(list, [1, 2, 3]);
    });
  });
}
