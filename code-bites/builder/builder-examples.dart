// This is just a fake future to show off, but you can check https://flutter.dev/docs/cookbook/networking/fetch-data for real example
final Future<String> dataLoader = Future<String>.delayed(
  const Duration(seconds: 2),
  () => 'Data Loaded',
);
// FutureBuilder example
FutureBuilder<List<String>>(
  future: dataLoader,
  builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {

    if (snapshot.data == null) {
      return CircularProgressIndicator();
    }
    // Text will be 'Data Loaded'
    return Text(snapshot.data);
  }
);

// again this is a stream to show off, but if you use firebase, or in some other occasions you will have real streams, you can use it in the same way
final Stream<int> _bids = (() async* {
  await Future<void>.delayed(const Duration(seconds: 1));
  yield 1;
  await Future<void>.delayed(const Duration(seconds: 1));
})();

// StreamBuilder example
StreamBuilder<int>(
  stream: _bids,
  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
    List<Widget> children;
    if (snapshot.hasError) {
      children = <Widget>[
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Error: ${snapshot.error}'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text('Stack trace: ${snapshot.stackTrace}'),
        ),
      ];
    } else {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          children = const <Widget>[
            Icon(
              Icons.info,
              color: Colors.blue,
              size: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Select a lot'),
            )
          ];
          break;
        case ConnectionState.waiting:
          children = const <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting bids...'),
            )
          ];
          break;
        case ConnectionState.active:
          children = <Widget>[
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('\$${snapshot.data}'),
            )
          ];
          break;
        case ConnectionState.done:
          children = <Widget>[
            const Icon(
              Icons.info,
              color: Colors.blue,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('\$${snapshot.data} (closed)'),
            )
          ];
          break;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  },
)