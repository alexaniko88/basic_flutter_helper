part of '../basic_flutter_helper.dart';

mixin SelfCancellableStreamMixin<T extends StatefulWidget> on State<T> {
  final List<StreamSubscription> _subscriptions = [];

  Future<void> cancelSubscriptions() async {
    for (var subscription in _subscriptions) {
      await subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  @override
  void dispose() {
    cancelSubscriptions();
    super.dispose();
  }
}

extension StateDisposableStreamSubscriton on StreamSubscription {
  void subscribeAsCancellable(SelfCancellableStreamMixin widget) {
    widget.addSubscription(this);
  }
}
