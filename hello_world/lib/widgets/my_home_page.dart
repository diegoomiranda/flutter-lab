import 'package:flutter/material.dart';
import 'package:hello_world/widgets/fancy_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> _buttons;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() => _counter = 0);
    _swap();
  }

  void _swap(){
    setState(() => _buttons.insert(0, _buttons.removeAt(_buttons.length -1)));
  }

  @override
  void initState() {
    super.initState();
    _buttons = <Widget>[
      FancyButton(
        key: UniqueKey(),
        child: Text(
          "Decrement",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: _decrementCounter,
      ),
      FancyButton(
        key: UniqueKey(),
        child: Text(
          "Increment",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: _incrementCounter,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 100.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Image.asset(
                'images/01_killing-em-with-cuteness-768x526.jpg',
                width: 250.0,
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buttons,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
