import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Int extension tests', () {
    /// formatBytes

    test('Having 0 bytes When formatBytes Then returns correct string for 0 bytes', () {
      expect(0.formatBytes(), '0 B');
    });

    test('Having some KB bytes When formatBytes Then returns correct string for KB', () {
      expect(1024.formatBytes(), '1 KB');
      expect(2048.formatBytes(), '2 KB');
    });

    test('Having some MB When formatBytes Then returns correct string for MB', () {
      expect(1048576.formatBytes(), '1 MB');
      expect(1073741824.formatBytes(), '1 GB');
    });

    test('Having a KB and 3 decimals When formatBytes Then returns correct string when passing custom decimals', () {
      expect(1024.formatBytes(decimals: 3), '1.000 KB');
    });

    test('Having a negative bytes When formatBytes Then returns 0', () {
      const value = -100;
      expect(value.formatBytes(), '0 B');
    });
  });
}
