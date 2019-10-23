import 'dart:convert';

import 'package:dgha/components/locationInfo.dart';
import 'package:dgha/screens/review/UserInfoPage.dart';
import 'package:dgha/screens/review/review_components/review_tile.dart';
import 'package:dgha/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Candidate{
final String formatted_address;
final String name;
final String place_id;


  Candidate({this.formatted_address,this.name,this.place_id});

  // factory Candidate.fromJson(Map<String, dynamic> json){
  //   return Candidate(
  //     formatted_address: json['formatted_address'],
  //     name: json['name'],
  //     place_id: json['place_id']
  //     );
  // }
}
class Candidates{
  List<Candidate> candidates;

  Candidates(List candidateslist){
    candidates=candidateslist;
  }

  
  // factory Candidates.fromJson(Map<String, dynamic> json){
  //   var list=json["candidates"] as List;
  //   List<Candidate> itemsList=list.map(((i)=>Candidate.fromJson(i)));
  //   return new Candidates(itemsList);
  // }
}

class ReviewLogggedIn extends StatefulWidget {
  ReviewLogggedIn({Key key,this.auth,this.userID,this.userEmail,this.logoutCallback})
  : super(key:key);

final BaseAuth auth;
final VoidCallback logoutCallback;
final String userID;
final String userEmail;

  @override
  State<StatefulWidget> createState() => new ReviewLoggedInState(userID,userEmail);
}

class ReviewLoggedInState extends State<ReviewLogggedIn>{
  ReviewLoggedInState(this.userID, this.userEmail);
  String userID;
  String userEmail;
  var jsonData;
  bool searched=false;
 

    signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
bool isenabled=true;

void initState(){}
  Widget build(BuildContext context) {
    var client=new http.Client();
        return new Scaffold(
          appBar: new AppBar(
            title: new Row(
              children:[
                Text("Reviews"),
                IconButton(
                  
                  icon: Icon(Icons.supervised_user_circle,color: Colors.white,),
                  onPressed:(){
                    if(isenabled){
                    isenabled=false;
                    String firstName;
                    String lastName;
                    final databaseReference = FirebaseDatabase.instance.reference();
                    databaseReference.child("/users/"+userID).once().then((DataSnapshot snapshot) async {
                    firstName=snapshot.value['fname'];
                    lastName=snapshot.value['lname'];
                    isenabled=true;
                    final result = await Navigator.push(context,MaterialPageRoute(builder: (context) => UserInfoPage(userID,firstName,lastName,userEmail)));
                    if(result=='logout')
                    {signOut();}
                    });
                  //   databaseReference.child("/users/"+userID).child("lname").once().then((DataSnapshot snapshot){
                  //     lastName=snapshot.value;
                  //    databaseReference.child("/users/"+userID).child("fname").once().then((DataSnapshot snapshot) async {
                  //      firstName=snapshot.value;
                  //      print(userID);
                  //      isenabled=true;
                  //      final result = await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => UserInfoPage(userID,firstName,lastName,userEmail)),
                  // );
                  // if(result=="logout")
                  // {signOut();}
                  //    });
                  //   }); 
      }} ,),],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,)
          ),
          body: new Container(
            height: 10000,
            child: new Column(children: <Widget>[
              Text("logged in review page"),
              Padding(padding: EdgeInsets.fromLTRB(0,0,0,20),
              child:
              TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Location Search',
                            icon: Icon(Icons.search)
                            ),
                        //controller: _titlecontroller,
                        //focusNode: _titleFocus,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a Search Term';
                            }
                          else if(value.length>100) {
                            return 'Please enter no more than 100 characters';
                            }
                          //response.title=value;
                          return null;
                          },
                        onFieldSubmitted: (value) async {
                          print("submitted"+value);
                          try{
                            print("VALUE="+value);
                             final response=await client.post('https://maps.googleapis.com/maps/api/place/findplacefromtext/json?parameters&key=AIzaSyAqYPLmIWI9DVaJiAYGUrTESCiiRvrTDFA&input='+value+'&inputtype=textquery&fields=formatted_address,name,place_id,photos');
                              //Candidates placesResponse=Candidates.fromJson(json.decode(response.body));
                              var jsonobject=json.decode(response.body);
                              
                              setState(() {
                                jsonData=jsonobject;
                              searched=true;
                              });
                              print(jsonobject);
                              //print(response.body);

                          }
                          catch(e)
                          {print("ERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERRORERROR");}
                              //print("APIRESPONSE+"+apiResponse);
                          
                          
                          }, 
                        ) 
              ,)
              ,
                        drawListview(),
                                ],)
                              ),
                            );
                          }
                        
                          drawListview() {
                            if(searched){
                               var list=jsonData["candidates"] as List;
                               print("drawlistview");
                            return new Expanded(child:ListView(children: list.map((f) =>GestureDetector(child: ReviewTile(f['name'],f['formatted_address']) ,onTap:(){
                              Navigator.push(
                              context,
                                MaterialPageRoute(builder: (context) => Locationinfo(f['name'],f['formatted_address'],f['placeid'],f['photos'][0]['photo_reference'])),
                  );
                            } ,)
                           ).toList()));
                            //return Text("text");
                            }
                            else{
                              return Text("Enter A Search Term");
                            }
                           
                          }
}