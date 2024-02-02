part of 'playground.dart';

class PlayGroundDataSource {
  static List<Widget> getList(BuildContext context) {
    return [
      PlaygroundWidget(
        title: "Extensions",
        action: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ExtensionsToy(),
            ),
          );
        },
      ),
    ];
  }
}
