part of '../../basic_flutter_helper.dart';

typedef ConnectivityStatusBuilder = Widget Function(BuildContext context, bool isOnline);

class ConnectivitySteamBuilder<ConnectivityStatus> extends StatefulWidget {
  const ConnectivitySteamBuilder({
    required this.builder,
    super.key,
  });

  final ConnectivityStatusBuilder builder;

  @override
  State<ConnectivitySteamBuilder> createState() => _ConnectivitySteamBuilderState();
}

class _ConnectivitySteamBuilderState extends State<ConnectivitySteamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      initialData: ConnectivityResult.wifi,
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) => widget.builder.call(
        context,
        ConnectivityStatus.fromConnectivityResult(snapshot.data!) == ConnectivityStatus.online,
      ),
    );
  }
}
