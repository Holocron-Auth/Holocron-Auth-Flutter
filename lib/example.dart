import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';

class Example extends StatefulWidget {
  final String number;
  const Example({Key? key, required this.number}) : super(key: key);

  @override
  ExampleState createState() => ExampleState();
}

class ExampleState extends State<Example> {

  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Running on: ' + widget.number + '\n'),
            // fillCards()
          ],
        ),
      ),
    );
  }
}
