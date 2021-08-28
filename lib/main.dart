import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,  // removes the debug banner
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline1: TextStyle(
            fontSize: 60.0,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      home: HomeView(title: 'Basic Flutter App'),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;
  HomeView({this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  List<Color> _color = [
    Colors.amber,
    Colors.redAccent,
    Colors.deepPurpleAccent,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color[_counter % _color.length],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(widget.title),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _resetCounter,
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: _decreaseCounter,
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: _increaseCounter,
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tapped button this many times:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
