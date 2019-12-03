import 'package:dgha/components/locationInfo.dart';
import 'package:dgha/services/authentication.dart';
import 'package:flutter/material.dart';


class LoginSignup extends StatefulWidget {
  LoginSignup({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;
  @override
  LoginSignupState createState() {
    return LoginSignupState();
  }
}

class LoginSignupState extends State<LoginSignup> {
//Variables
  final _formKey = new GlobalKey<FormState>();
  bool _isLoading = false;
  String _email = " ";
  String _fName=" ";
  String _lName=" ";
  String _password = " ";
  bool _isLoginForm = false;
  String _errorMessage = " ";
  

//Widgets
  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    if(_isLoading)
    {
      return Container(
      height: 0.0,
      width: 0.0,
    );
    }
    else
    {
      return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
    }
    
  }
  
  Widget showfirstnameInput(){
     if(_isLoading)
    {
      return Container(
      height: 0.0,
      width: 0.0,
    );
    }
    else
    {
    if(!_isLoginForm){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,15.0,0,0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'First Name',
          icon: new Icon(Icons.supervised_user_circle,color: Colors.grey,)
        ),
        validator: (value) => value.isEmpty ? 'First Name can\'t be empty' : value.length>20 ? 'First Name can\'t be longer than 20 characters': null,
        onSaved: (value) => _fName=value.trim(),
      ),
    );
    }
    else
    {return Container(height: 0.0,);}
    }
  }

    Widget showlastnameInput(){
     if(_isLoading)
    {
      return Container(
      height: 0.0,
      width: 0.0,
    );
    }
    else
    {
    if(!_isLoginForm){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,15.0,0,0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Last Name',
          icon: new Icon(Icons.supervised_user_circle,color: Colors.grey,)
        ),
        validator: (value) => value.isEmpty ? 'Last Name can\'t be empty' : value.length>20 ? 'Last Name can\'t be longer than 20 characters': null,
        onSaved: (value) => _lName=value.trim(),
      ),
    );
    }
    else
    {return Container(height: 0.0,);}}
  }

  Widget showPasswordInput() {
     if(_isLoading)
    {
      return Container(
      height: 0.0,
      width: 0.0,
    );
    }
    else
    {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }
  }

  Widget showPrimaryButton() {
     if(_isLoading)
    {
      return Container(
      height: 0.0,
      width: 0.0,
    );
    }
    else
    {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text(_isLoginForm ? 'Login' : 'Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }}

  Widget showSecondaryButton() {
     if(_isLoading)
    {
      return Container(
      height: 0.0,
      width: 0.0,
    );
    }
    else
    {
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }}

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
  

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showLogo(),
              showEmailInput(),
              showfirstnameInput(),
              showlastnameInput(),
              showPasswordInput(),
              showPrimaryButton(),
              showSecondaryButton(),
              showErrorMessage(),
            ],
          ),
        ));
  }

//Functions
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
        setState(() {
      _isLoading = false;
    });
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          print('trying to sign up$_email');
          userId = await widget.auth.signUp(_email, _password,_fName,_lName);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
            "Successfully Signed Up!",
          )));
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review')),
      body: Stack(
        children: <Widget>[
          _showForm(),
          showCircularProgress(),
          
          
          // MaterialButton(
          //   height: 40.0,
          //   minWidth: 100.0,
          //   color: Theme.of(context).primaryColor,
          //   textColor: Colors.white,
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute<void>(builder: (context) => LocationInfo('TestName','testaddress','testid','AIzaSyAqYPLmIWI9DVaJiAYGUrTESCiiRvrTDFA')),
          //     );
          //   },
          //   child: Text('location info'),
          // ),
          // MaterialButton(
          //   height: 40.0,
          //   minWidth: 200.0,
          //   color: Theme.of(context).primaryColor,
          //   textColor: Colors.white,
          //   onPressed: ()
          //   {
          //     final databaseReference = FirebaseDatabase.instance.reference();
          //     try{
          //       databaseReference.child('1').set(
          //       {
          //         'fname':'_fName',
          //         'lname':'_lName',
          //       }
          //       );
          //       print('A\N/N');}
          //       catch (e){
          //         print(e.toString());
          //         }
          //   },
          //   child: Text('TEST FIREBASE USERNAME'),
          // )
        ],
      ),
    );
  }
}
