part of '../basic_flutter_helper.dart';

const double _opacity = 0.2;

class DisabledContent extends StatelessWidget {
  const DisabledContent({
    super.key,
    required this.child,
    this.withConnectivity = false,
    this.isDisabled = true,
    this.onTap,
  });

  factory DisabledContent.byConnectivity({
    Key? key,
    required Widget child,
  }) =>
      DisabledContent(
        key: key,
        withConnectivity: true,
        isDisabled: true,
        child: child,
      );

  final Widget child;
  final bool withConnectivity;
  final bool isDisabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return withConnectivity
        ? ConnectivitySteamBuilder(
            builder: (context, isOnline) {
              return isOnline ? child : _buildIgnorePointer();
            },
          )
        : _buildIgnorePointer();
  }

  Widget _buildIgnorePointer() => isDisabled
      ? onTap != null
          ? GestureDetector(
              onTap: onTap,
              child: Opacity(
                opacity: _opacity,
                child: child,
              ),
            )
          : IgnorePointer(
              child: Opacity(
                opacity: _opacity,
                child: child,
              ),
            )
      : child;
}
