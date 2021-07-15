import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);

  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Home', Icons.home, Colors.pink),
  Destination(1, 'Favourites', Icons.favorite, Colors.cyan),
  Destination(2, 'Profile', Icons.person, Colors.orange),
  Destination(3, 'Cart', Icons.shopping_cart, Colors.blue)
];
bool _isChecked = true;

class RootPage extends StatelessWidget {
  const RootPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, "/list");
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      margin: EdgeInsets.all(12),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          new Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 8),
                                isDense: true,
                              ),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Browse themes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: 180.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int i) => Card(
                          child: Container(
                            width: 160.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SvgPicture.asset("assets/images/two.svg",height: 150,width: 150,),
                                Text("Desert")
                              ],
                            ),
                          ),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Design your home garden",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.sort),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset("assets/images/one.svg"),
                          ),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: CheckboxListTile(
                                    checkColor: Colors.white,
                                    activeColor: Colors.black,
                                    title: Text("Monstrea"),
                                    subtitle: Text("Desert Chec"),
                                    onChanged: (val) {},
                                    value: _isChecked,
                                  ))),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 0, 20, 0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset("assets/images/two.svg"),
                          ),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: CheckboxListTile(
                                    title: Text("Aglaonema"),
                                    subtitle: Text("This is description"),
                                    onChanged: (val) {},
                                    value: false,
                                  )))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 0, 20, 0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset("assets/images/four.svg"),
                          ),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: CheckboxListTile(
                                    title: Text("Peace lily"),
                                    subtitle: Text("This is description"),
                                    onChanged: (val) {},
                                    value: false,
                                  )))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(100, 0, 20, 0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: shades.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 128,
              child: Card(
                color: destination.color[shades[index]].withOpacity(0.25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/text");
                  },
                  child: Center(
                    child: Text('Item $index',
                        style: Theme.of(context).primaryTextTheme.display1),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination, this.onNavigation})
      : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case '/list':
                return ListPage(destination: widget.destination);
              case '/text':
                return TextPage(destination: widget.destination);
            }
          },
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  List<Key> _destinationKeys;
  List<AnimationController> _faders;
  AnimationController _hide;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders =
        allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys =
        List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
            .toList();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: allDestinations.map((Destination destination) {
              final Widget view = FadeTransition(
                opacity: _faders[destination.index]
                    .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                child: KeyedSubtree(
                  key: _destinationKeys[destination.index],
                  child: DestinationView(
                    destination: destination,
                    onNavigation: () {
                      _hide.forward();
                    },
                  ),
                ),
              );
              if (destination.index == _currentIndex) {
                _faders[destination.index].forward();
                return view;
              } else {
                _faders[destination.index].reverse();
                if (_faders[destination.index].isAnimating) {
                  return IgnorePointer(child: view);
                }
                return Offstage(child: view);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _hide,
            axisAlignment: -1.0,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: allDestinations.map((Destination destination) {
                return BottomNavigationBarItem(
                    icon: Icon(destination.icon),
                    backgroundColor: Colors.pink[100],
                    title: Text(destination.title));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}

//
// Padding(
// padding: EdgeInsets.all(10),
// child: Expanded(
// child: SizedBox(
// height: 100,
// child: ListView(
// scrollDirection: Axis.horizontal,
// children: <Widget>[
// Container(
// width: 150,
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(7.0)),
// color: Colors.white,
// elevation: 4,
// child: ListTile(
// subtitle: Text(
// "Desert chic",
// style: TextStyle(color: Colors.black),
// ),
// title: SvgPicture.asset(
// "assets/images/one.svg"),
// )
// ),
// ),
// Container(
// width: 150,
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(7.0)),
// color: Colors.white,
// elevation: 4,
// child: ListTile(
// subtitle: Text(
// "Desert chic",
// style: TextStyle(color: Colors.black),
// ),
// title: SvgPicture.asset(
// "assets/images/two.svg"),
// )
// ),
// ),
// Container(
// width: 150,
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(7.0)),
// color: Colors.white,
// elevation: 4,
// child: ListTile(
// subtitle: Text(
// "Desert chic",
// style: TextStyle(color: Colors.black,),
// ),
// title: SvgPicture.asset(
// "assets/images/four.svg"),
// )),
// ),
// Container(
// width: 150,
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(7.0)),
// color: Colors.white,
// elevation: 4,
// child: ListTile(
// subtitle: Text(
// "Desert chic",
// style: TextStyle(color: Colors.black),
// ),
// title: SvgPicture.asset(
// "assets/images/light_welcome_illos.svg"),
// )),
// ),
// ],
// ),
// )),
// ),
