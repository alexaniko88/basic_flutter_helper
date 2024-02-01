part of extensions;

extension PlatformExt on TargetPlatform {

  static bool isAndroid([BuildContext? context]) => getPlatform(context) == TargetPlatform.android;

  static bool isIOS([BuildContext? context]) => getPlatform(context) == TargetPlatform.iOS;

  static bool isMacOS([BuildContext? context]) => getPlatform(context) == TargetPlatform.macOS;

  static bool isLinux([BuildContext? context]) => getPlatform(context) == TargetPlatform.linux;

  static bool isWindows([BuildContext? context]) => getPlatform(context) == TargetPlatform.windows;

  static bool isMobile([BuildContext? context]) {
    final platform = getPlatform(context);
    return (platform == TargetPlatform.android || platform == TargetPlatform.iOS);
  }

  static bool isDesktop([BuildContext? context]) {
    final platform = getPlatform(context);
    return platform == TargetPlatform.windows || platform == TargetPlatform.macOS || platform == TargetPlatform.linux;
  }

  static TargetPlatform getPlatform([BuildContext? context]) =>
      context != null ? Theme.of(context).platform : defaultTargetPlatform;
}
