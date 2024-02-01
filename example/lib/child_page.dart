import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter/material.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({super.key});

  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> with SelfCancellableStreamMixin {

  @override
  void initState() {
    listenForConnectivityChange(
      onOnline: () => print("ONLINE!"),
      onOffline: () => print("OFFLINE!!!"),
    ).subscribeAsCancellable(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CHILD PAGE"),
      ),
      body: Center(
        child: ConnectivitySteamBuilder(
          builder: (context, isOnline) {
            return Text("IS ONLINE: $isOnline");
          },
        ),
      ),
    );
  }
}
