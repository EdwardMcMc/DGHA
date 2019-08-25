import 'package:flutter/material.dart';
import 'package:dgha/utils/geolocator.dart';

class Legislation extends StatefulWidget {
  Legislation({Key key}) : super(key: key);

  _LegislationState createState() => _LegislationState();
}

class _LegislationState extends State<Legislation> {
  String _state;
  Geolocation _geolocation = Geolocation();

  @override
  void initState() {
    super.initState();
    _geolocation.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Legislation')),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('$_state'),
                onPressed: () => _state = _geolocation.state)
          ],
        ),
      ),
    );
  }
}
