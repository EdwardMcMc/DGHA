import 'package:dgha/services/authentication.dart';
import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  Review({Key key,this.auth,this.userID,this.logoutCallback})
  : super(key:key);

final BaseAuth auth;
final VoidCallback logoutCallback;
final String userID;

  @override
  State<StatefulWidget> createState() => new ReviewState();
}

class ReviewState extends State<Review>{
    signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Row(children:[Text("Reviews"),])
      ),
      body: new Container(
        child: new Row(children: <Widget>[
          Text("logged in reviw page"),
          RaisedButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
        ],)
      ),
    );
  }
}