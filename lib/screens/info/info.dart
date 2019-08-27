import 'package:flutter/material.dart';
import 'legislation/legislation.dart';
import 'package:dgha/utils/geolocator.dart';
import 'package:dgha/screens/info/access/access.dart';

class Info extends StatelessWidget {
  final Geolocation _geolocation = Geolocation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info')),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => Legislation(_geolocation.state),
                  ));
            },
            child: Text('Legislation'),
          ),
          RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => Access(_geolocation.state),
                    ));
              },
              child: Text('Access'))
        ],
      ),
    );
  }
}
