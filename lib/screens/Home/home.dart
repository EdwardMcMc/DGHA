import 'package:dgha/screens/home/Donation/donation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Info')),
        body: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (context) => Donation()));
            },
            child: Text('Donate')));
  }
 }
}