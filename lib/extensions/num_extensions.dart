part of '../basic_flutter_helper.dart';

extension NumDurationExtensions on num {
  /// Microseconds representation as [Duration]
  Duration get microseconds => Duration(microseconds: round());

  /// Milliseconds representation as [Duration]
  Duration get ms => (this * 1000).microseconds;

  /// Seconds representation as [Duration]
  Duration get sec => (this * 1000 * 1000).microseconds;

  /// Minutes representation as [Duration]
  Duration get min => (this * 1000 * 1000 * 60).microseconds;

  /// Hours representation as [Duration]
  Duration get hrs => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Days representation as [Duration]
  Duration get dd => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
}
