import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  final String _title = 'BMI Calculator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiHome(title: _title),
    );
  }
}

class BmiHome extends StatefulWidget {
  BmiHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BmiHomeState createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  int _weight = 0;
  int _height = 0;
  double _currentBmi = 0;

  Function _calculateBmi() {
    return () {
      setState(() {
        var heightInMeters = _height / 100;
        _currentBmi = _weight / (heightInMeters * heightInMeters);
      });
    };
  }

  Color _getColor(double bmiValue) {
    if (bmiValue <= 18.5) return Colors.yellow;
    if (bmiValue > 18.5 && bmiValue < 25) return Colors.green;
    if (bmiValue > 25 && bmiValue < 30) return Color.fromARGB(255, 255, 204, 203);
    return Colors.red;
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
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  _height = int.parse(text);
                },
                decoration: InputDecoration(
                  hintText: "Input your height in cm",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  onChanged: (text) {
                    _weight = int.parse(text);
                  },
                  decoration:
                      InputDecoration(hintText: "Input your weight in kg"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ]),
            ),
            Text(
              '$_currentBmi',
              style: TextStyle(
                color: _getColor(_currentBmi),
                fontWeight: FontWeight.w900,
              ),
            ),
            RaisedButton(child: Text("Calculate"), onPressed: _calculateBmi()),
          ],
        ),
      ),
    );
  }
}
