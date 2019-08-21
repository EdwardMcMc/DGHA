import 'package:flutter/material.dart';
import 'landing.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DGHA',
      home: Landing(),
    );
  }
}
