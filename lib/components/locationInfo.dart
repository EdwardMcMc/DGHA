import 'package:flutter/material.dart';
import 'package:dgha/style.dart';

class Locationinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Info"),
      ),
      body: Container(
          child: Row(
        children: <Widget>[
          ratings(),
          ratings(),
          ratings(),
          ratings(),
        ],
      )),
    );
  }

  Widget ratings() {
    return Container(
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 65.0,
            ),
            Text("4.5",
                style: new TextStyle(
                  fontSize: 20.0,
                )),
          ],
        ),
        Row(
          children: <Widget>[
            Text("Overall",
                style: new TextStyle(
                  fontSize: 20.0,
                ))
          ],
        )
      ]),
    );
  }
}
