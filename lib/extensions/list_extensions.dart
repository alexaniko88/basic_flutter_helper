part of '../basic_flutter_helper.dart';

extension NullableListExtention<T> on List<T>? {

  bool get isNullOrEmpty => this?.isEmpty ?? true;

  List<T> safeList() {
    if (this != null) {
      this!.removeWhere((item) => item == null);
    }
    return this ?? <T>[];
  }

  void addSafely(T? item) {
    if (item != null) {
      this?.add(item);
    }
  }
}
