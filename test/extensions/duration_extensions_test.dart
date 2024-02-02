import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DurationExtension', () {
    /// asMinutesAndSeconds

    test('Having 5 minutes duration When asMinutesAndSeconds is called Then returns correct format', () {
      const fiveMinutes = Duration(minutes: 5);
      expect(fiveMinutes.asMinutesAndSeconds, '05:00');

      const twoMinutesThirtySeconds = Duration(minutes: 2, seconds: 30);
      expect(twoMinutesThirtySeconds.asMinutesAndSeconds, '02:30');
    });

    test('Having 1 minute and 2 seconds duration When asMinutesAndSeconds is called Then returns correct format', () {
      const oneMinuteTwoSeconds = Duration(minutes: 1, seconds: 2);
      expect(oneMinuteTwoSeconds.asMinutesAndSeconds, '01:02');
    });

    test('Having 0 seconds duration When asMinutesAndSeconds is called Then returns correct format', () {
      const oneMinute = Duration(seconds: 0);
      expect(oneMinute.asMinutesAndSeconds, '00:00');
    });

    test('Having 30 seconds duration When asMinutesAndSeconds is called Then returns correct format', () {
      const thirtySeconds = Duration(seconds: 30);
      expect(thirtySeconds.asMinutesAndSeconds, '00:30');
    });

    test(
        'Having 90 minutes duration When asMinutesAndSeconds is called Then returns 30 minutes format as the time is overlapped by 1 hour',
        () {
      const ninetyMinutes = Duration(minutes: 90);
      expect(ninetyMinutes.asMinutesAndSeconds, '30:00');
    });
  });
}
