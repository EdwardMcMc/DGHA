import 'dart:convert';

import 'package:dgha/components/mapbox.dart';
import 'package:dgha/screens/review/review_form.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dgha/style.dart';
import 'package:http/http.dart' as http;

class LocationInfo extends StatefulWidget {
  String address;
  String name;
  String photoReference;
  String placeID;

  LocationInfo(this.name,this.address,this.placeID,this.photoReference);

  @override
  State<StatefulWidget> createState() {
    return _LocationInfo(name,address,placeID,photoReference);
  }
}


class _LocationInfo extends State<LocationInfo> {

_LocationInfo(this.name,this.address,this.placeID,this.photoReference);

String name;
String address;
String placeID; 
String photoReference;
//bool loaded=false;
DataSnapshot apiResponse;
final databaseReference = FirebaseDatabase.instance.reference();
var jsonobj;
 Map<dynamic, dynamic> map;

  @override
  initState() {
    super.initState();
    databaseReference.child("/reviews/"+placeID).once().then((DataSnapshot snapshot) {
      map = snapshot.value;
                                 setState(() {apiResponse=snapshot;
                                 });

                                 //print(apiResponse.toString());

                                 });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Location Info"),
        ),
        body: SingleChildScrollView(
          
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                        showImage(),
                        //MapBox(LatLng(-37.8, 145.0)),
                        showName(),
                        showAddress(),
                        showRatings(),
                        RaisedButton(
                          child: Text("Review"),
                          onPressed:(){Navigator.push(
                              context,
                                MaterialPageRoute(builder: (context) => ReviewForm(placeID)),
                          );},
                          ),
                        showReviews()
                                              ],
                                            ))
                                    
                                            );
                                      
                                      }
                                    
                                      Widget showName() {
                                        return Container(
                                          padding: EdgeInsets.fromLTRB(0, 8.0, 0 ,0),
                                          child: Text(
                                            name,
                                            style: new TextStyle(
                                              fontSize: 26.0,
                                            ),
                                          ),
                                        );
                                      }
                                    
                                      Widget showAddress() {
                                        return Container(
                                          child: Text(
                                            address,
                                            style: new TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        );
                                      }
                                    
                                      Widget showRatings() {
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
                                    
                                      showImage()  {
                                        //var client=new http.Client();
                                        //final response= await client.post("https://maps.googleapis.com/maps/api/place/photo?parameters&key=AIzaSyAqYPLmIWI9DVaJiAYGUrTESCiiRvrTDFA&photoreference="+photoReference+"&maxheight=1000");
                                                        return 
                                        Stack(children: <Widget>[Padding(padding:EdgeInsets.fromLTRB(0, 100, 0 ,0),child:Center(child: CircularProgressIndicator())),Image.network("https://maps.googleapis.com/maps/api/place/photo?parameters&key=AIzaSyAqYPLmIWI9DVaJiAYGUrTESCiiRvrTDFA&photoreference=$photoReference&maxwidth=1600", width: 600.0,
                                                  height: 220.0,
                                                  fit: BoxFit.cover,)]);
                                        Image.asset(
                                                  'assets/images/maps.png',
                                                  width: 600.0,
                                                  height: 220.0,
                                                  fit: BoxFit.cover,
                                                )
                                                
                                      ;
                                      }
                        
                          showReviews() {
                              print(placeID);               
                                 if(apiResponse!=null&&apiResponse.value!=null&&map!=null){
                                 
                                   print(apiResponse.value.toString());
                                   return Column(children: map.values.toList().map((item)=>Card(child:Row(children: <Widget>[Text(item['reviewText'].toString())],))).toList());
                                   return Text(apiResponse.value.toString());
                                 }                                  
                                 else
                                 {return Text("No Reviews Yet!");}

                                 
                              //   print(snapshot);
                               
                                // if(snapshot.value==null){
                                  
                                //   return Column(children: <Widget>[Text("No Reviews Yet, Be the first to post one!")],);
                                // }
                                // else{
                                // return Column(children: <Widget>[Text(snapshot.value)],);
                                // }
                                
                              // });
                            // }
                            // else{
                            //   print(placeID);
                            //   return Column(children: <Widget>[Text("No Location ID")]);
                            // }
                          }

}
