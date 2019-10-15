import 'package:flutter/material.dart';
import 'package:dgha/style.dart';

class Locationinfo extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location Info"),),
      body: rating(),
    );
  }

  Widget rating() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("* Rating"),
          Text("Overall"),          
        ],
      ),
    );
  }
}