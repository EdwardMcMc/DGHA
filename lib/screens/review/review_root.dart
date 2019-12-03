import 'package:flutter/material.dart';
import 'package:dgha/screens/review/review_login.dart';
import 'package:dgha/services/authentication.dart';
import 'package:dgha/screens/review/review_logged_in.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class ReviewRoot extends StatefulWidget {
  

  final BaseAuth auth= Auth();

  @override
  State<StatefulWidget> createState() => new _ReviewRootState();
}

class _ReviewRootState extends State<ReviewRoot> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  String _userEmail="";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
          _userEmail=user?.email;
          //print("EMAIL: $_userEmail");
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
        _userEmail=user.email.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
      _userEmail="";
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginSignup(auth: widget.auth, loginCallback: loginCallback,

        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          //print("userID= $_userId");
          //print("XXXXXXXXXXuserEmail: $_userEmail");

          return new ReviewLogggedIn(
            userID: _userId,
            userEmail:_userEmail,
            auth: widget.auth,
            logoutCallback: logoutCallback,

          );
        } else
          return buildWaitingScreen();
        break;
      default:
        return buildWaitingScreen();
    }
  }
}