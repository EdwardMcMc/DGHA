import 'package:dgha/components/text_section.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final String userID;
  final String firstname;
  final String lastname;
  final String userEmail;



  const UserInfoPage(this.userID,this.firstname,this.lastname,this.userEmail);
  
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Container(
        child:Center(child:Column(children: <Widget>[
            TextSection("First Name",firstname),
            TextSection("Last Name",lastname),
            TextSection("Email",userEmail),
            RaisedButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed:(){Navigator.pop(context,'logout');})
          ],) ,)
          ,),);
  }
}