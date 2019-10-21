import 'package:dgha/components/mapbox.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dgha/style.dart';

class Locationinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Info"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        MapBox(LatLng(-37.8, 145.0)),
        title(),
        address(),
        ratings(),
      ],)
    );
  }

    Widget title() {
    return Container(
      child: Text("Location Heading",
      style: new TextStyle(
        fontSize: 26.0,
      ),),
    );
  }
  Widget address() {
    return Container(
      child: Text("Address",
      style: new TextStyle(
        fontSize: 20.0,
      ),),
    );
  }

  Widget ratings() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column( 
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("4.5",
                          style: new TextStyle(
                            fontSize: 18.0,
                          )),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 50.0,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Overall",
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("4.5",
                          style: new TextStyle(
                            fontSize: 18.0,
                          )),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 50.0,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Customer",
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Service",
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(                                       
                    children: <Widget>[
                      Text("4.5",
                          style: new TextStyle(
                            fontSize: 18.0,
                          )),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 50.0,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Location",
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("4.5",
                          style: new TextStyle(
                            fontSize: 18.0,
                          )),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 50.0,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Amenities",
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
