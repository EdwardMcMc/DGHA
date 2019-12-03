import 'package:dgha/screens/review/review_form.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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

bool loading=true;
String name;
String address;
String placeID; 
String photoReference;
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
      loading=false;});
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
                          onPressed:() async {
                            final result= await Navigator.push(
                              context,
                                MaterialPageRoute(builder: (context) => ReviewForm(placeID)),
                          );
                          if (result=="posted")
                          {Navigator.pop(context,'posted');}
                          },
                          ),
                        showReviews()
                        ],)));
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
                                    
  showRatings() {
      double amenRating=0;
      double custRating=0;
      double locRating=0;
      double overall=0;
      if(apiResponse!=null&&apiResponse.value!=null&&map!=null)
      {
        for(int i=0;i<map.values.toList().length;i++)
        {
          amenRating+=map.values.toList()[i]['amenRating'];
          custRating+=map.values.toList()[i]['custRating'];
          locRating+=map.values.toList()[i]['locRating'];
        }
        amenRating=amenRating/map.values.toList().length;
        custRating=custRating/map.values.toList().length;
        locRating=locRating/map.values.toList().length;
        overall=(amenRating+custRating+locRating)/3;
        return ratings(amenRating.toStringAsFixed(1), custRating.toStringAsFixed(1), locRating.toStringAsFixed(1), overall.toStringAsFixed(1));
      }
      else{
        return ratings("N/A","N/A","N/A","N/A");
      }
  }

  Widget ratings(String amen,String cust,String loc,String over) {
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
                      Text(over,
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
                      Text(cust,
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
                      Text(loc,
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
                      Text(amen,
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

                                    
  showImage() 
  {
    if(photoReference=='1234')
    {
      return Stack(children: <Widget>[Padding(padding:EdgeInsets.fromLTRB(0, 100, 0 ,0),child:Center(child: CircularProgressIndicator())),Image.asset('assets/images/noImage.jpg', width: 600.0,height: 220.0, fit: BoxFit.cover,)]);
    }  
    else
    {
      return Stack(children: <Widget>[Padding(padding:EdgeInsets.fromLTRB(0, 100, 0 ,0),child:Center(child: CircularProgressIndicator())),Image.network("https://maps.googleapis.com/maps/api/place/photo?parameters&key=AIzaSyAqYPLmIWI9DVaJiAYGUrTESCiiRvrTDFA&photoreference=$photoReference&maxwidth=1600", width: 600.0,height: 220.0, fit: BoxFit.cover,)]);
    }    
  }
                        
  showReviews() 
  {
    print(placeID);
    if(loading)
    {return Center(child: CircularProgressIndicator());}              
    else if(apiResponse!=null&&apiResponse.value!=null&&map!=null)
    {
      databaseReference.child("/reviews/"+placeID).once().then((DataSnapshot snapshot) {
      map = snapshot.value;
      //setState(() {apiResponse=snapshot;});
      });
      print(apiResponse.value.toString());
      return Column(children: map.values.toList().map((item)=>reviewCard(item['reviewText'].toString(),item['locRating'].toString(),item['amenRating'].toString(),item['custRating'].toString())).toList());
    }                                  
    else
    {
      return Padding(padding:EdgeInsets.fromLTRB(0, 60, 0 ,0), child:Text("No Reviews Yet, Be The First to Post One!"));
    }
  }
}

Widget reviewCard(String reviewText,String loc,String amen, String cust)
{
  return Card(child:Column(children: <Widget>[Padding(padding:EdgeInsets.fromLTRB(0, 0, 0 ,8),child:Text('"'+reviewText+'"')),
  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget>[
    Column(children: <Widget>[
      Text("Location"),
      Row(children: showstars(loc),),   
    ],),
    Column(children: <Widget>[
      Text("Amenities"),
      Row(children: showstars(amen),),   
    ],),
    Column(children: <Widget>[
      Text("Customer Service"),
      Row(children: showstars(cust),),   
    ],)
  ])

    ],));
}

showstars(String n) {
  try{
    int num=int.parse(n);
    var list=new List<Widget>();
    //list.add(Text(n));
    for(int i=0;i<num;i++)
    {
      list.add(Icon(Icons.star, color: Colors.yellow, size: 20.0,));
    }
    return(list);
  }
  catch(e){
    return Text(n);
  }
}
