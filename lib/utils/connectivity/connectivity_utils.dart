part of '../../basic_flutter_helper.dart';

enum ConnectivityStatus {
  online,
  offline;

  static ConnectivityStatus fromConnectivityResult(ConnectivityResult? connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.online;
    }
  }
}

Future<void> doIfOnline(FutureOr Function() action) async {
  final result = await Connectivity().checkConnectivity();
  if (ConnectivityStatus.fromConnectivityResult(result) == ConnectivityStatus.online) {
    return action.call();
  }
}

Future<void> doIfOffline(FutureOr Function() action) async {
  final result = await Connectivity().checkConnectivity();
  if (ConnectivityStatus.fromConnectivityResult(result) == ConnectivityStatus.offline) {
    return action.call();
  }
}

StreamSubscription<ConnectivityResult> listenForConnectivityChange({
  required FutureOr Function() onOnline,
  required FutureOr Function() onOffline,
}) {
  return Connectivity().onConnectivityChanged.listen((result) {
    switch (ConnectivityStatus.fromConnectivityResult(result)) {
      case ConnectivityStatus.online:
        onOnline.call();
        break;
      case ConnectivityStatus.offline:
        onOffline.call();
        break;
    }
  });
}
