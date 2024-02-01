part of 'extensions.dart';

extension StringExtensions on String? {
  /// Returns this string or empty string if this string is null.
  String get orEmpty => this != null ? this! : '';

  /// Returns [true] if is either null or empty.
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  /// Returns [true] if is not null and not empty string.
  bool get isNotNullAndNotEmpty => this != null && this!.trim().isNotEmpty;

  /// Returns the string capitalized or the same string in case is null or empty.
  String? get asCapitalized => isNullOrEmpty ? this : "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";

  /// Returns the string capitalized by words or the same string in case is null or empty.
  String? get asCapitalizeByWord => isNullOrEmpty
      ? this
      : this!.split(' ').map((element) => element.asCapitalized).join(" ");
}
