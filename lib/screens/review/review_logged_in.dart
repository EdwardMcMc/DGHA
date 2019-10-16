import 'package:dgha/services/authentication.dart';
import 'package:flutter/material.dart';

class ReviewLogggedIn extends StatefulWidget {
  ReviewLogggedIn({Key key,this.auth,this.userID,this.logoutCallback})
  : super(key:key);

final BaseAuth auth;
final VoidCallback logoutCallback;
final String userID;

  @override
  State<StatefulWidget> createState() => new ReviewLoggedInState(userID);
}

class ReviewLoggedInState extends State<ReviewLogggedIn>{
  ReviewLoggedInState(String userID){userID=userID;}
  String userID;

  openUserInfo(String id){
    print("about to try open user info");
    //return new UserInfo(userID);
  }  

    signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  // Widget userInfoPage(){
  //   return new Scaffold(
  //     appBar: AppBar(title: Text("User Info"),),
  //     body:new Container(
  //       child: Row(children: <Widget>[
  //         Text(widget.auth.getCurrentUser().toString()),
  //       ],)
  //     ));
  // }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Row(children:[Text("Reviews"),IconButton(icon: Icon(Icons.supervised_user_circle,color: Colors.white,),onPressed:(){openUserInfo(userID);} ,),],mainAxisAlignment: MainAxisAlignment.spaceBetween,)
      ),
      body: new Container(
        child: new Row(children: <Widget>[
          Text("logged in reviw page"),
          RaisedButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut),
        ],)
      ),
    );
  }
}