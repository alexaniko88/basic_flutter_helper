part of 'mixins.dart';

mixin SafeEmitCubitMixin<T> on Cubit<T> {
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}