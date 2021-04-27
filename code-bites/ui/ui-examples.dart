// Scaffold is the scaffold of our page.
var scaffoldExample = Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    title: 'Sample Title'
  ),
  // actions can be buttons, or any element
  actions: [],
  body: Container(
    child: Text(
      'This is a sample body text',
      style: TextStyle(color: Colors.gray, fontWeight: FontWeight.bold)
    )
  )
);

// ListView is as you can see, a list view. Note: Its a scrollable object :)
var listViewExample = ListView(
  // childrens can be any widget, they will be listed vertically (default), or horizontally based on your configuration
  children: []
);

// Column is as you can see, a column. Note: Its not a scrollable object :)
var columnExample = Column(
  // alignment of children how they will stay.
  mainAxisAlignment: MainAxisAlignment.start,
  // main axis size of the column. min means fill only childs area and finish, if it was max it would fill whole parent.
  mainAxisSize: MainAxisSize.min,
  // childrens can be any widget, they will be listed vertically
  children: []
);

// Row is as you can see, a row. Note: Its not a scrollable object :)
var rowExample = Row(
  // alignment of children how they will stay.
  mainAxisAlignment: MainAxisAlignment.start,
  // main axis size of the row. min means fill only childs area and finish, if it was max it would fill whole parent.
  mainAxisSize: MainAxisSize.min,
  // childrens can be any widget, they will be listed horizontally
  children: []
);

// Alignment is used for alinging widgets in a certain position
var alingExample = Align(
  // there are multiple alignment options, just check it. This example aligns to top left
  alignment: Alignment.topLeft,
  child: Container()
);

// Padding is used for giving padding to widgets in a certain extent
var paddingExample = Padding(
  // there are multiple EdgeInset options, just check it. This example gives all (top, right, bottom, left) 5px padding
  padding: EdgeInsets.all(5),
  child: Container()
);

// Image Asset example
var image = Image.asset('assets/test.png');

// Image network example
var image = Image.network('https://picsum.photos/200/300');

// button example (for all button types check https://flutter.dev/docs/development/ui/widgets/material#Buttons)
var button = TextButton(
  onPressed: () {
    print('skip clicked');
  },
  child: Text('Skip Now', style: TextStyle(color: Colors.red))
)