part of '../basic_flutter_helper.dart';

printLog(String message, {Object? class_}) {
  var prefix = class_ == null ? "" : class_.runtimeType.toString();
  if (message.length < 2000) {
    debugPrintThrottled("$prefix: $message");
  } else {
    developer.log("$prefix: $message");
  }
}
