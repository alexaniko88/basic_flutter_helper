part of '../basic_flutter_helper.dart';

/// Basic string extensions
extension NullableStringExtensions on String? {
  /// Returns this string or empty string if this string is null.
  String get orEmpty => this != null ? this! : '';

  /// Returns [true] if is either null or empty.
  bool get isNullOrEmpty => this?.trim().isEmpty ?? true;

  /// Returns [true] if is not null and not empty string.
  bool get isNotNullAndNotEmpty => this?.trim().isNotEmpty ?? false;

  /// Returns the string capitalized or the same string in case is null or empty.
  String? get asCapitalized => this != null ? StringExtensions(this!).asCapitalized : this;

  /// Returns the string capitalized by words or the same string in case is null or empty.
  String? get asCapitalizeByWord => this != null ? StringExtensions(this!).asCapitalizeByWord : this;
}

extension StringExtensions on String {
  /// Returns the string capitalized or the same string in case is null or empty.
  String get asCapitalized => trim().isEmpty ? this : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  /// Returns the string capitalized by words or the same string in case is null or empty.
  String get asCapitalizeByWord =>
      trim().isEmpty ? this : split(' ').map((element) => element.asCapitalized).join(" ");
}
