import 'package:flutter/material.dart';

class Legislation extends StatelessWidget {
  final String _state;

  Legislation(this._state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Legislation')),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text('$_state'), onPressed: () => {})
          ],
        ),
      ),
    );
  }
}
