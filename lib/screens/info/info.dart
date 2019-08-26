import 'package:flutter/material.dart';
import 'legislation/legislation.dart';
import 'package:dgha/utils/geolocator.dart';

class Info extends StatelessWidget {
  Geolocation _geolocation = Geolocation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info')),
      body: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => Legislation(_geolocation.state),
            ),
          );
        },
        child: Text('Legislation'),
      ),
    );
  }
}
