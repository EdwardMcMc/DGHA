import 'package:flutter/material.dart';
import 'package:dgha/utils/geolocator.dart';
import 'package:dgha/style.dart';
import 'package:dgha/data/markdown/access.dart';
import 'review_components/review_tile.dart';
import 'package:dgha/components/mapbox.dart';

class ListLocation extends StatelessWidget {
  final Access access = Access();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(title: Text('Locations')),
        body: Container(
          child: ListBody(
            children: <Widget>[
              ReviewTile("Hello World"),
            ],
          ),

        ));
  }
}
