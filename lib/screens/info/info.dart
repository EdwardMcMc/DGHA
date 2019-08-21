import 'package:flutter/material.dart';
import 'legislation/legislation.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info')),
      body: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => Legislation(),
            ),
          );
        },
        child: Text('Legislation'),
      ),
    );
  }
}
