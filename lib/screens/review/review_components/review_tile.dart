import 'package:flutter/material.dart';
import 'package:dgha/components/mapbox.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ReviewTile extends StatelessWidget {
  final String _title;

  ReviewTile(this._title);

  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        MapBox(LatLng(-37.8226, 145.0354)),
        Container(
          child: ListTile(
              leading: FlutterLogo(),
              title: Text(_title),
              subtitle: Text('Here is a second line'),
          ),
        ),
      ],
    );
  }

}