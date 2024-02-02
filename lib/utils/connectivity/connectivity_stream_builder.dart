part of '../../basic_flutter_helper.dart';

typedef ConnectivityStatusBuilder = Widget Function(BuildContext context, bool isOnline);

class ConnectivitySteamBuilder extends StatelessWidget {
  const ConnectivitySteamBuilder({
    required this.builder,
    super.key,
  });

  final ConnectivityStatusBuilder builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      initialData: ConnectivityResult.wifi,
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) => builder.call(
        context,
        ConnectivityStatus.fromConnectivityResult(snapshot.data!) == ConnectivityStatus.online,
      ),
    );
  }
}
