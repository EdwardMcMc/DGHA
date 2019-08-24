import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  String _membertype;
  PageController controller=PageController();
  bool membertypevalid=false;
  String _title;
  String _fname;
  String _lname;
  String _address;
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("MMMM d y");
  TextEditingController _titlecontroller=TextEditingController();
  TextEditingController _fnamecontroller=TextEditingController();
  TextEditingController _lnamecontroller=TextEditingController();
  TextEditingController _addresscontroller=TextEditingController();

   Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: const Text('Full Member'),
                  leading: Radio(
                    value: "Full",
                    groupValue: _membertype,
                    onChanged: (String value) {
                      setState(() {
                        _membertype=value; 
                        });
                      membertypevalid=true;
                      },
                    ),
                  ),
                ListTile(
                  title: const Text('Associate Member'),
                  leading: Radio(
                    value: "Associate",
                    groupValue: _membertype,
                    onChanged: (String value) {
                      setState(() {
                        _membertype=value; 
                        });
                      membertypevalid=true;
                      },
                    ),
                  ),
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
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Select Membership Type')));
                          }
                        },
                      child: Text('Submit'),
                      )
                  )
                ],
              ),

//Page 2 Start
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Title"),
                  TextFormField(
                    controller: _titlecontroller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if(value.length>10) {
                        return 'Please enter no more than 10 characters';
                        }
                      _title=value;
                      return null;
                      }, 
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()){
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
                ),

//page 3 start

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("FirstName"),
                  TextFormField(
                    controller: _fnamecontroller,
                    validator: (value) {
                      if(value==_fname)
                      {return null;}
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      else if(value.length>40)
                      {
                        return 'Please enter no more than 40 characters';
                      }
                      _fname=value;
                      return null;
                      },
                    ),
                  Text("Last Name"),
                  TextFormField(
                    controller:_lnamecontroller,
                    validator:(value){
                      if(value==_lname) {
                        return null;
                        }
                      if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if(value.length>40) {
                        return 'Please enter no more than 40 characters';
                        }
                      _lname=value;
                      return null; 
                      },
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ),  
                    ),
                  Padding(padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                        _titlecontroller.text=_title;
                        controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                        },
                      child: Text("Back"),
                      )
                    )
                  ]
                ),

//page 4 start

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Date of Birth (optional)"),
                        Text(dateFormat.format(selectedDate)),
                        RaisedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select date'),
                          ),
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

    //Page 5 Start

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Stret or Postal Address"),
                  TextFormField(
                    controller: _addresscontroller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                        }
                      else if (value.length>70) {
                        return 'Please enter no more than 70 characters';
                        }
                      _address=value;
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
                  // Padding(padding:const EdgeInsets.all(10.0),
                  //   child: RaisedButton(
                  //     onPressed: (){
                  //       controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                  //       },     
                  //     child: Text("Back"),
                  //     )
                  //   )
                  ],
                ),

    //page 6 Start
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("page7"),
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
    Text("page8")
    ,
    Text("page9")
    ,
    Text("page10")
    ],)))
;
  }
}
    