part of 'mixins.dart';

mixin SelfCancellableStreamsCubitMixin<T> on Cubit<T> {
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
  Future<void> close() async {
    await cancelSubscriptions();
    return super.close();
  }
}

extension CubitDisposableStreamSubscriton on StreamSubscription {
  void subscribeInCubitAsCancellable(SelfCancellableStreamsCubitMixin widget) {
    widget.addSubscription(this);
  }
}
