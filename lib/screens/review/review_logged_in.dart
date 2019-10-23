import 'package:dgha/screens/review/UserInfoPage.dart';
import 'package:dgha/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
                databaseReference.child("/users/"+userID).child("lname").once().then((DataSnapshot snapshot){
                  lastName=snapshot.value;
                 databaseReference.child("/users/"+userID).child("fname").once().then((DataSnapshot snapshot) async {
                   firstName=snapshot.value;
                   print(userID);
                   isenabled=true;
                   final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfoPage(userID,firstName,lastName,userEmail)),
              );
              if(result=="logout")
              {signOut();}
                 });
                 
                
                }); 
  }} ,),],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,)
      ),
      body: new Container(
        child: new Row(children: <Widget>[
          Text("logged in review page"),
        ],)
      ),
    );
  }
}