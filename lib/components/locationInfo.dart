import 'package:flutter/material.dart';
import 'package:dgha/style.dart';

class Locationinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Info"),
      ),
      body: ratings(),
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
