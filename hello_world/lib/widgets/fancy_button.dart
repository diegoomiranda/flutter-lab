import 'dart:math';

import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({Key key, this.onPressed, this.child}) : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  final _random = new Random();

  var _colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.amber,
    Colors.lightBlue
  ];

  var _buttonColors = <_FancyButtonState, Color>{};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: _getColor(),
        child: widget.child,
        onPressed: widget.onPressed,
      ),
    );
  }

  Color _getColor() {
    return _buttonColors.putIfAbsent(this, () => _colors[next(0, 5)]);
  }

  int next(int min, int max) => min + _random.nextInt(max);
}
