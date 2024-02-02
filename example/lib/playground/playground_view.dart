part of 'playground.dart';

class PlaygroundView extends StatefulWidget {
  const PlaygroundView({
    super.key,
  });

  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> {
  static const String _searchText = 'Search';
  static const double _searchBorderRadius = 10;
  static const double _searchEdgePadding = 16.0;

  List<Widget> items = [];
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    _initWidgetList();
    super.initState();
  }

  @override
  void dispose() {
    items = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Widget\'s playground',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(_searchEdgePadding),
              child: _inputTextField(),
            ),
            Expanded(child: _listView()),
          ],
        ),
      ),
    );
  }

  void _initWidgetList() => items.addAll(PlayGroundDataSource.getList(context));

  void _filterSearchResults(String query) {
    if (query.isNotEmpty) {
      final filteredItems = items
          .where((widget) =>
              widget.toString().toLowerCase().contains(query.toLowerCase()) ||
              ((widget is PlaygroundWidget) && widget.title.toLowerCase().contains(query.toLowerCase())))
          .toList();
      setState(() {
        items.clear();
        items.addAll(filteredItems);
      });
    } else {
      _resetList();
    }
  }

  void _resetList() {
    setState(() {
      items.clear();
      _initWidgetList();
    });
  }

  Widget _listView() {
    return ListView.separated(
      separatorBuilder: (context, _) => const Divider(
        color: Colors.grey,
      ),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _playgroundListItem(index, context),
    );
  }

  TextField _inputTextField() {
    return TextField(
      onChanged: (value) {
        _filterSearchResults(value);
      },
      controller: editingController,
      decoration: const InputDecoration(
        labelText: _searchText,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent),
          borderRadius: BorderRadius.all(
            Radius.circular(_searchBorderRadius),
          ),
        ),
      ),
    );
  }

  ListTile _playgroundListItem(
    int index,
    BuildContext context,
  ) {
    final widgetItem = (items[index] as PlaygroundWidget);
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      title: Text(
        widgetItem.title,
        style: TextStyle(
          fontWeight: widgetItem.boldTitle ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        widgetItem.action != null
            ? widgetItem.action?.call()
            : _navigateToWidgetDetail(
                context: context,
                childWidget: widgetItem.child ?? const SizedBox.shrink(),
                customTitle: widgetItem.title,
              );
      },
    );
  }

  void _navigateToWidgetDetail({
    required BuildContext context,
    required Widget childWidget,
    required String customTitle,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _PlaygroundDetail(
          customTitle: customTitle,
          child: childWidget,
        ),
      ),
    );
  }
}

class _PlaygroundDetail extends StatelessWidget {
  final Widget child;
  final String customTitle;

  const _PlaygroundDetail({
    super.key,
    required this.child,
    required this.customTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          customTitle,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 1,
      ),
      body: Container(
        child: child,
      ),
    );
  }
}
