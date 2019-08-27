import 'package:dgha/screens/Home/membership/membership.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/formresponse.dart';


class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  FormResponse response=new FormResponse();
  String _membertype;
  PageController controller=PageController();
  bool membertypevalid=false;
  String datestring = "None selected";
  DateFormat dateFormat = DateFormat("MMMM d y");
  TextEditingController _titlecontroller=TextEditingController();
  TextEditingController _fnamecontroller=TextEditingController();
  TextEditingController _lnamecontroller=TextEditingController();
  TextEditingController _addresscontroller=TextEditingController();
  TextEditingController _suburbcontroller=TextEditingController();
  TextEditingController _statecontroller=TextEditingController();
  TextEditingController _postcodecontroller=TextEditingController();

  DateTime initialdate() {
    if (response.dob != null)
    {
      return response.dob;
    }
    else
    {
      return DateTime.now();
    }
  }

   Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialdate(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != response.dob)
      setState(() {
        response.dob = picked;
        datestring=dateFormat.format(response.dob);
      });
  }


  @override
  Widget build(BuildContext context) {

  return
    Scaffold(
     appBar: AppBar(title: Text('Membership')),
     body: Form(
      key: _formKey,
      child: 
        PageView(controller: controller,
          physics:new NeverScrollableScrollPhysics(),
          children: <Widget>[
//page 1 start
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap:(){setState(() {
                   response.memberType="Full" ;
                   membertypevalid=true;
                  });} ,
                  child: 
                ListTile(
                  title: const Text('Full Member'),
                  leading: Radio(
                    value: "Full",
                    groupValue: response.memberType,
                    onChanged: (String value) {
                      setState(() {
                        response.memberType=value; 
                        });
                      membertypevalid=true;
                      },
                    ),
                  ),
                  ),
                  GestureDetector(
                  onTap:(){setState(() {
                   response.memberType="Associate" ;
                   membertypevalid=true;
                  });} ,
                  child: 
                ListTile(
                  title: const Text('Associate Member'),
                  leading: Radio(
                    value: "Associate",
                    groupValue: response.memberType,
                    onChanged: (String value) {
                      setState(() {
                        response.memberType=value; 
                        });
                      membertypevalid=true;
                      },
                    ),
                  )),  

          
                  
                Padding(                 
                  padding:const EdgeInsets.all(10.0),
                  child:                 
                    RaisedButton(
                      onPressed: () {                            
                      // Validate returns true if the form is valid, otherwise false.
                        if (membertypevalid) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        else {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Select Membership Type'), duration: Duration(seconds: 3),));
                          }
                        },
                      child: Text('Next'),
                      )
                  ),
                                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => Membership()),
                    );
                  },
                  child: Text('Back'),
                ),
                  )
                ],
              ),

//Page 2 Start
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Title',
                        icon: Icon(Icons.title)
                        ),
                    controller: _titlecontroller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if(value.length>10) {
                        return 'Please enter no more than 10 characters';
                        }
                      response.title=value;
                      return null;
                      }, 
                    ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'First Name',
                        icon: Icon(Icons.person)
                        ),
                    controller: _fnamecontroller,
                    validator: (value) {
                      if(value==response.fname)
                      {return null;}
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      else if(value.length>40)
                      {
                        return 'Please enter no more than 40 characters';
                      }
                      response.fname=value;
                      return null;
                      },
                    ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Last Name',
                        icon: Icon(Icons.person)
                        ),
                    controller:_lnamecontroller,
                    validator:(value){
                      if(value==response.lname) {
                        return null;
                        }
                      if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if(value.length>40) {
                        return 'Please enter no more than 40 characters';
                        }
                      response.lname=value;
                      return null; 
                      },
                    ),
                  RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ),
                  Padding(padding:const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    )
                  ],
                ),

//page 3 start
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Date of Birth (optional)"),

                        RaisedButton.icon(
                          icon:Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                          label: Text('Select date'),
                          ),
                          Text("Selected Date: "+ datestring),
                        ],
                      ),
                    ),
                  
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        if (_formKey.currentState.validate()) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                      },
                      child: Text("Next"),
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(10.0),  
                    child: RaisedButton(
                      onPressed: (){
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    ),
                  ]
                ),

    //Page 4 Start

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Street or Postal Address',
                      icon: Icon(Icons.home)
                    ),
                    controller: _addresscontroller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if (value.length>70) {
                        return 'Please enter no more than 70 characters';
                        }
                      response.address=value;
                      return null;
                      },  
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Suburb',
                        icon: Icon(Icons.location_on)
                        ),
                        controller: _suburbcontroller,
                      validator: (value) {
                         if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if (value.length>70) {
                        return 'Please enter no more than 70 characters';
                        }
                      response.suburb=value;
                      return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'State or Territory',
                        icon: Icon(Icons.map)
                        ),
                        controller: _statecontroller,
                      validator: (value) {
                         if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if (value.length>40) {
                        return 'Please enter no more than 40 characters';
                        }
                      response.state=value;
                      return null;
                      },),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Postcode',
                        icon: Icon(Icons.local_post_office)
                        ),
                      controller: _postcodecontroller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      validator: (value){
                      if(value.isEmpty)
                      {
                        return 'Please enter some text';
                      }
                      else if(value.length<4||value.length>4)
                      {
                        return 'Please Enter a 4 digit postcode';
                      }
                      response.postcode=value;
                      return null;
                    },),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ),  
                    ),
                  Padding(padding:const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    ),
                  ],
                ),

    //page 5 Start
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      icon: Icon(Icons.phone)
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    validator: (value){
                      if (value.isEmpty)
                      {
                        return "Please enter a phone number";
                      }
                      else if(value.length<8||value.length>10)
                      
                      {
                        return  "Please enter a number between 8 and 10 characters long";
                      }
                      response.phone=value;
                      return null;
                    },
                    ),
                    TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      icon: Icon(Icons.email)
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if (value.isEmpty)
                      {
                        return "Please enter an email";
                      }
                      else if(!value.contains("@")) {
                        return "please enter a valid Email";
                        }
                        //following doesn't work?
                      // else if(!value.contains('.')) {
                      //   return "please enter a valid Email";
                      //   }

                      response.email=value;
                      return null;
                    },
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ),  
                    ),
                  Padding(padding:const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    ),
                  ]
                )
    ,
//page 6 start
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Text("page6"),
      Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ),  
                    ),
                  Padding(padding:const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    )
      ],
    )
    ,
//page 7 start
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Text("page7"),
      Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ),  
                    ),
                  Padding(padding:const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    )
      ],
    )
    ,
//page 8 start
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Text("page8"),
      Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ),  
                    ),
                  Padding(padding:const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    )
      ],
    )
    ],)))
;
  }
}
    