part of 'playground.dart';

class PlaygroundWidget extends StatelessWidget {
  const PlaygroundWidget({
    super.key,
    required this.title,
    this.child,
    this.action,
    this.wrapWithScaffold = true,
    this.boldTitle = false,
  });

  final String title;
  final Widget? child;
  final VoidCallback? action;
  final bool wrapWithScaffold;
  final bool boldTitle;

  @override
  Widget build(BuildContext context) {
    return wrapWithScaffold && child != null ? Scaffold(body: child) : child ?? const SizedBox.shrink();
  }
}
