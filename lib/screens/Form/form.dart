
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:dgha/models/formresponse.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';


class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class DropdownFormField<T> extends FormField<T> {
  DropdownFormField({
    Key key,
    InputDecoration decoration,
    T initialValue,
    List<DropdownMenuItem<T>> items,
    bool autovalidate = false,
    FormFieldSetter<T> onSaved,
    FormFieldValidator<T> validator,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          initialValue: items.contains(initialValue) ? initialValue : null,
          builder: (FormFieldState<T> field) {
            final InputDecoration effectiveDecoration = (decoration ?? const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);

            return InputDecorator(
              decoration:
                  effectiveDecoration.copyWith(errorText: field.hasError ? field.errorText : null),
              isEmpty: field.value == '' || field.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  value: field.value,
                  isDense: true,
                  onChanged: field.didChange,
                  items: items.toList(),
                ),
              ),
            );
          },
        );
}

class MyCustomFormState extends State<MyCustomForm> {

final databaseReference = FirebaseDatabase.instance.reference();
var uuid = new Uuid();

 //Form Keys: used to define a form and perform validation
final _form1Key = GlobalKey<FormState>(); //page 2
final _form2Key = GlobalKey<FormState>(); //page 3
final _form3Key = GlobalKey<FormState>(); //page 4
final _form4Key = GlobalKey<FormState>(); //page 7
final _form5Key = GlobalKey<FormState>(); //page 8
final _form6Key = GlobalKey<FormState>(); //page 9

  FormResponse response=new FormResponse();
  PageController controller=PageController();
  bool membertypevalid=false;
  bool dogtrainedforvalid=false;
  bool dogtrainedforother=true;
  bool workfororg=true;
  int maxlines=2; 
  String datestring = "None selected";
  DateFormat dateFormat = DateFormat("MMMM d y");
  Color iconcolor=Colors.black45;

  //Text Editing Controllers:
  //Used To Control text in forms
  TextEditingController _titlecontroller=TextEditingController();
  TextEditingController _fnamecontroller=TextEditingController();
  TextEditingController _lnamecontroller=TextEditingController();
  TextEditingController _addresscontroller=TextEditingController();
  TextEditingController _suburbcontroller=TextEditingController();
  TextEditingController _postcodecontroller=TextEditingController();
  TextEditingController _phonecontroller=TextEditingController();
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _dognamecontroller=TextEditingController();
  TextEditingController _dogbreedcontroller=TextEditingController();
  TextEditingController _dogtrainercontroller=TextEditingController();
  TextEditingController _dogtrainedforothercontroller=TextEditingController();
  TextEditingController _organisationnamecontroller=TextEditingController();
  TextEditingController _positioncontroller=TextEditingController();

  //Focus Nodes:      define what text field to go to next
final FocusNode _titleFocus = FocusNode();  
final FocusNode _fnameFocus = FocusNode();  
final FocusNode _lnameFocus = FocusNode();
final FocusNode _addressFocus = FocusNode();  
final FocusNode _suburbFocus = FocusNode();  
final FocusNode _stateFocus = FocusNode();
final FocusNode _postcodeFocus = FocusNode();  
final FocusNode _phoneFocus = FocusNode();  
final FocusNode _emailFocus = FocusNode();
final FocusNode _dogNameFocus = FocusNode();  
final FocusNode _dogBreedFocus = FocusNode();  
final FocusNode _dogTrainerFocus = FocusNode();
final FocusNode _dogTrainedForOtherFocus = FocusNode();
final FocusNode _organisationNameFocus = FocusNode();
final FocusNode _positionFocus = FocusNode();


//Focus change function, used to change focus between text fields
_fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
}

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
  String dateToString(DateTime d){
    try {
      String s=d.toIso8601String();
      return s;
    }
    catch (e){
      return "null";
    }
  }

   Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialdate(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
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
     body: PageView(controller: controller,
          physics:new NeverScrollableScrollPhysics(),
          children: <Widget>[
//page 1 start
SingleChildScrollView(
  child:Column(
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
                    Builder(
                      builder: (context) => RaisedButton(
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
                      ),
                    ), 
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:RaisedButton(
                    onPressed: () {
                      Navigator.pop(context); },
                  child: Text('Back'),
                ),
                  )
                ],
              )
            ),

//Page 2 Start
SingleChildScrollView(
  child:Form(
              key:_form1Key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Title',
                        icon: Icon(Icons.title)
                        ),
                    controller: _titlecontroller,
                    focusNode: _titleFocus,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a title';
                        }
                      else if(value.length>10) {
                        return 'Please enter no more than 10 characters';
                        }
                      response.title=value;
                      return null;
                      },
                    onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _titleFocus, _fnameFocus);
                      response.title=value;
                      }, 
                    ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'First Name',
                        icon: Icon(Icons.person)
                        ),
                    controller: _fnamecontroller,
                    focusNode: _fnameFocus,
                    validator: (value) {
                      if(value==response.fname)
                      {return null;}
                      if (value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      else if(value.length>40)
                      {
                        return 'Please enter no more than 40 characters';
                      }
                      response.fname=value;
                      return null;
                      },
                    onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _fnameFocus, _lnameFocus);
                      response.fname=value;
                      }, 
                    ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Last Name',
                        icon: Icon(Icons.person)
                        ),
                    controller:_lnamecontroller,
                    focusNode: _lnameFocus,
                    validator:(value){
                      if(value==response.lname) {
                        return null;
                        }
                      if (value.isEmpty) {
                        return 'Please enter your last name';
                        }
                      else if(value.length>40) {
                        return 'Please enter no more than 40 characters';
                        }
                      response.lname=value;
                      return null; 
                      },
                      onFieldSubmitted: (value){
                        response.lname=value;
                        },
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_form1Key.currentState.validate()){
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        },
                      child: Text("Next"),
                      ) ,
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
              )),

//page 3 start
SingleChildScrollView(
  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Date of Birth (optional)",style: Theme.of(context).textTheme.title),

                        RaisedButton.icon(
                          icon:Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                          label: Text('Select date'),
                          ),
                          Text("Selected Date: "+ datestring,style: Theme.of(context).textTheme.title,),
                        ],
                      ),
                    ),
                  
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: (){
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);                          
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
)),

    //Page 4 Start
    SingleChildScrollView(
  child: Form(
              key:_form2Key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Street or Postal Address',
                      icon: Icon(Icons.home)
                    ),
                    controller: _addresscontroller,
                    focusNode: _addressFocus,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter an address';
                        }
                      else if (value.length>70) {
                        return 'Please enter no more than 70 characters';
                        }
                      response.address=value;
                      return null;
                      },
                    onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _addressFocus, _suburbFocus);
                    },    
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Suburb',
                        icon: Icon(Icons.location_on)
                        ),
                        controller: _suburbcontroller,
                        focusNode: _suburbFocus,
                      validator: (value) {
                         if (value.isEmpty) {
                        return 'Please enter your suburb';
                        }
                      else if (value.length>70) {
                        return 'Please enter no more than 70 characters';
                        }
                      response.suburb=value;
                      return null;
                      },
                      onFieldSubmitted: (value) {
                      _fieldFocusChange(context, _suburbFocus, _stateFocus);
                    },
                    ),
          //           Row(children: <Widget>[
          //             Padding(padding: const EdgeInsets.fromLTRB(2.0,2,10,2),
          //             child:Icon(Icons.map,color: iconcolor,)),
          //             DropdownButton<String>(
          //               hint: Text('State or Territory'),
          //               //isExpanded: true, 
          //               //icon: Icon(Icons.map),
          //               value: response.state,
          //               onChanged: (String newValue) {
          //                 setState(() {
          //                   response.state = newValue;
          //                   });
          //                 },
          //               items: [
          //                 DropdownMenuItem(
          //                   child: Text("Australian Capital Territory"),
          //                   value: "ACT",
          //                   ),
          //                   DropdownMenuItem(
          //                   child: Text("New South Wales"),
          //                   value: "NSW",
          //                   ),
          //                   DropdownMenuItem(
          //                   child: Text("Northern Territory"),
          //                   value: "NT",
          //                   ),
          //                   DropdownMenuItem(
          //                   child: Text("Queensland"),
          //                   value: "QLD",
          //                   ),
          //                   DropdownMenuItem(
          //                   child: Text("South Australia"),
          //                   value: "SA",
          //                   ),
          //                   DropdownMenuItem(
          //                   child: Text("Tasmania"),
          //                   value: "Tas",
          //                   ),
          //                   DropdownMenuItem(
          //                   child: Text("Victoria"),
          //                   value: "Vic",
          //                   ),
          //                   DropdownMenuItem(
          //                   child: Text("Western Australia"),
          //                   value: "WA",
          //                   ),
          //                 ]
          // )],),
                  // FormField(
                  //   builder: (FormFieldState state) {
                  //     return InputDecorator(
                  //       decoration: InputDecoration(
                  //         icon: const Icon(Icons.map),
                  //         labelText: 'State or T',
                  //       ),
                  //       isEmpty: response.state == '',
                  //       child: new DropdownButtonHideUnderline(
                  //         child: new DropdownButton(
                  //           value: response.state,
                  //           isDense: true,
                  //           onChanged: (String newValue) {
                  //             setState(() {
                  //               response.state = newValue;
                                
                  //               state.didChange(newValue);
                  //             });
                  //           },
                  //           items: [
                  //         DropdownMenuItem(
                  //           child: Text("Australian Capital Territory"),
                  //           value: "ACT",
                  //           ),
                  //           DropdownMenuItem(
                  //           child: Text("New South Wales"),
                  //           value: "NSW",
                  //           ),
                  //           DropdownMenuItem(
                  //           child: Text("Northern Territory"),
                  //           value: "NT",
                  //           ),
                  //           DropdownMenuItem(
                  //           child: Text("Queensland"),
                  //           value: "QLD",
                  //           ),
                  //           DropdownMenuItem(
                  //           child: Text("South Australia"),
                  //           value: "SA",
                  //           ),
                  //           DropdownMenuItem(
                  //           child: Text("Tasmania"),
                  //           value: "Tas",
                  //           ),
                  //           DropdownMenuItem(
                  //           child: Text("Victoria"),
                  //           value: "Vic",
                  //           ),
                  //           DropdownMenuItem(
                  //           child: Text("Western Australia"),
                  //           value: "WA",
                  //           ),
                  //         ]
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),

                    DropdownFormField<String>(
              
            validator: (value) {
              if (value == null) {
                return 'Please select your state';
              }
              return null;
            },
            onSaved: (value) {
              response.state=value;
            },
            decoration: InputDecoration(
                          icon: const Icon(Icons.map),
                          labelText: 'State',
                        ),
            initialValue: null,
            items: [
                          DropdownMenuItem(
                            child: Text("Australian Capital Territory"),
                            value: "ACT",
                            ),
                            DropdownMenuItem(
                            child: Text("New South Wales"),
                            value: "NSW",
                            ),
                            DropdownMenuItem(
                            child: Text("Northern Territory"),
                            value: "NT",
                            ),
                            DropdownMenuItem(
                            child: Text("Queensland"),
                            value: "QLD",
                            ),
                            DropdownMenuItem(
                            child: Text("South Australia"),
                            value: "SA",
                            ),
                            DropdownMenuItem(
                            child: Text("Tasmania"),
                            value: "Tas",
                            ),
                            DropdownMenuItem(
                            child: Text("Victoria"),
                            value: "Vic",
                            ),
                            DropdownMenuItem(
                            child: Text("Western Australia"),
                            value: "WA",
                            ),
                          ],
          ),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Postcode',
                        icon: Icon(Icons.local_post_office)
                        ),
                      controller: _postcodecontroller,
                      focusNode: _postcodeFocus,
                      keyboardType: TextInputType.number,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      validator: (value){
                        if(value.isEmpty) {
                          return 'Please enter your postcode';
                          }
                        else if(value.length<4||value.length>4) {
                          return 'Please Enter a 4 digit postcode';
                          }
                        response.postcode=value;
                        return null;
                        },
                      ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {
                        if(_form2Key.currentState.validate()) {
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
                )
              )),

    //page 5 Start
          SingleChildScrollView(
            child:Form(
              key:_form3Key,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      icon: Icon(Icons.phone)
                    ),
                    keyboardType: TextInputType.phone,
                    controller: _phonecontroller,
                    focusNode: _phoneFocus,
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
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _phoneFocus, _emailFocus);
                    },
                    ),
                    TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      icon: Icon(Icons.email)
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    focusNode: _emailFocus,
                    validator: (value){
                      if (value.isEmpty)
                      {
                        return "Please enter an email";
                      }
                      else if(!value.contains("@")) {
                        return "please enter a valid Email";
                        }
                      else if(!value.contains('.'))
                      {
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
                        if(_form3Key.currentState.validate()) {
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
            )
        )
    ,
//page 6 start
SingleChildScrollView(
  child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Your dog is trained for:",style:Theme.of(context).textTheme.title),
                GestureDetector(
                  onTap:(){setState(() {
                   response.dogTrainedFor="Dog Guide used for mobility" ;
                   dogtrainedforvalid=true;
                  });} ,
                  child: 
                ListTile(
                  title: const Text('Dog Guide used for mobility by people who are blind or vision impaired'),
                  leading: Radio(
                    value: "Dog Guide used for mobility",
                    groupValue: response.dogTrainedFor,
                    onChanged: (String value) {
                      setState(() {
                        response.dogTrainedFor=value; 
                        });
                      dogtrainedforvalid=true;
                      },
                    ),
                  ),
                  ),
                  GestureDetector(
                  onTap:(){setState(() {
                   response.dogTrainedFor="Puppy Raiser" ;
                   dogtrainedforvalid=true;
                  });} ,
                  child: 
                ListTile(
                  title: const Text('Puppy Raiser involved in a training program'),
                  leading: Radio(
                    value: "Puppy Raiser",
                    groupValue: response.dogTrainedFor,
                    onChanged: (String value) {
                      setState(() {
                        response.dogTrainedFor=value; 
                        });
                      dogtrainedforvalid=true;
                      },
                    ),
                  )),
                  GestureDetector(
                  onTap:(){setState(() {
                   response.dogTrainedFor="N/A" ;
                   dogtrainedforvalid=true;
                  });} ,
                  child: 
                ListTile(
                  title: const Text('Not applicable'),
                  leading: Radio(
                    value: "N/A",
                    groupValue: response.dogTrainedFor,
                    onChanged: (String value) {
                      setState(() {
                        response.dogTrainedFor=value; 
                        });
                      dogtrainedforvalid=true;
                      },
                    ),
                  )
                ),     
                Padding(                 
                  padding:const EdgeInsets.all(10.0),
                  child:
                  Builder(
                    builder:(context) => RaisedButton(
                      onPressed: () {                            
                      // Validate returns true if the form is valid, otherwise false.
                        if (dogtrainedforvalid) {
                          controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);
                          }
                        else {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please select what your dog is trained for'), duration: Duration(seconds: 3),));
                          }
                        },
                      child: Text('Next'),
                      ),)                 
                    
                  ),
                                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:RaisedButton(
                  onPressed: () {
                    controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                  },
                  child: Text('Back'),
                ),
                  )
                ],
              )
            )
    ,
//page 7 start
SingleChildScrollView(
  child:
    Form(
      key: _form4Key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name of dog guide or puppy',
              icon: Icon(FontAwesomeIcons.dog)
              ),
            controller: _dognamecontroller,
            focusNode: _dogNameFocus,
            validator: (value){
              if (value!=null){
                if(value.length>40)
                {return "Please Enter a name Shorter than 40 Characters";}
              }
              response.dogName=value;
              return null;
            },
            onFieldSubmitted: (term) {
          _fieldFocusChange(context, _dogNameFocus, _dogBreedFocus);
        },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Breed of dog',
              icon: Icon(FontAwesomeIcons.paw)
              ),
            controller: _dogbreedcontroller,
            focusNode: _dogBreedFocus,
            validator: (value){
              if (value!=null){
                if(value.length>40)
                {return "Please Enter a breed Shorter than 40 Characters";}
              }
              response.dogBreed=value;
              return null;
            },
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, _dogBreedFocus, _dogTrainerFocus);
              },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Training provider or organisation',
              icon: Icon(FontAwesomeIcons.bone)
              ),
            controller: _dogtrainercontroller,
            focusNode: _dogTrainerFocus,
            validator: (value){
              if (value!=null){
                if(value.length>100)
                {return "Please Enter a Trainer Shorter than 100 Characters";}
              }
              response.trainer=value;
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
             onPressed: () {
                if(_form4Key.currentState.validate()) {
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
      )
    ),
//page 8 start
SingleChildScrollView(
  child:Form(
    key: _form5Key,
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("Is your dog is also trained to assist you with a disability other than blindness or vision impairment?"),
        GestureDetector(
                  onTap:(){setState(() {
                   response.dogTrainedForOther="N/A" ;
                   dogtrainedforother=false;
                  });} ,
                  child: 
                ListTile(
                  title: const Text('No'),
                  leading: Radio(
                    value: false,
                    groupValue: dogtrainedforother, onChanged: (bool value) {},
                    ),
                  ),
                  ),
        GestureDetector(
                  onTap:(){
                    setState(() {
                      dogtrainedforother=true;
                      });
                    FocusScope.of(context).requestFocus(_dogTrainedForOtherFocus);
                    } ,
                  child: 
                ListTile(
                  title: const Text('Yes'),
                  leading: Radio(
                    value: true,
                    groupValue: dogtrainedforother, onChanged: (bool value) {},
                    ),
                  ),
                  ),
        TextFormField(
          //keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
           labelText: 'Please indicate what the dog is trained for?',
            icon: Icon(Icons.help)
            ),
            enabled: dogtrainedforother,
         controller: _dogtrainedforothercontroller,
          focusNode: _dogTrainedForOtherFocus,
          validator: (value){
            if(dogtrainedforother) {
              if (value.isEmpty) {
                return "Please enter an answer, or select no";
                }
              else if(value.length>100) { 
                return "Please Enter a response Shorter than 100 Characters";
                }
              else {
                response.dogTrainedForOther=value;
                return null; 
                }
              }
            else{
              response.dogTrainedForOther='';
              return null;
            }

            },
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                if(_form5Key.currentState.validate()) {
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
    )
  ),
//page 9 start
SingleChildScrollView(
  child:Form(
    key: _form6Key,
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("Do you work for a Dog Guide or other blindness organisation?"),
        GestureDetector(
          onTap:(){setState(() {
            response.workForOrg=false ;
            workfororg=false;
            });},
          child: 
            ListTile(
              title: const Text('No'),
              leading: Radio(
                value: false,
                groupValue: workfororg, onChanged: (bool value) {},
                ),
              ),
          ),
        GestureDetector(
          onTap:(){
            setState(() {
              response.workForOrg=true;
              workfororg=true;
              });
            FocusScope.of(context).requestFocus(_organisationNameFocus);
            } ,
          child: 
            ListTile(
              title: const Text('Yes'),
              leading: Radio(
                value: true,
                groupValue: workfororg, onChanged: (bool value) {},
                ),
              ),
          ),
        TextFormField(
          onSaved: (value){
            maxlines=null;
          },
          //keyboardType: TextInputType.multiline,
          maxLines: maxlines,
          decoration: const InputDecoration(
           labelText: 'Name of organisation',
           hintText: 'Name of Dog Guide or Assistance dog provider, or other blindness organisation',
            icon: Icon(Icons.business)
            ),
            enabled: workfororg,
         controller: _organisationnamecontroller,
          focusNode: _organisationNameFocus,
          validator: (value){
            if(workfororg) {
              if (value.isEmpty) {
                return "Please enter the name of the organisation, or select no";
                }
              else if(value.length>100) { 
                return "Please Enter a response Shorter than 100 Characters";
                }
              else {
                response.workForOrgName=value;
                return null;
                }
              }
            else{
              response.workForOrgName='';
              return null;
              }
            },
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, _organisationNameFocus, _positionFocus);
            } ,
          ),
          TextFormField(
          //keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
           labelText: 'Position or Title',
            icon: Icon(FontAwesomeIcons.userTie)
            ),
            enabled: workfororg,
         controller: _positioncontroller,
          focusNode: _positionFocus,
          validator: (value){
            if(workfororg) {
              if (value.isEmpty) {
                return "Please enter the name of the Position, or select no";
                }
              else if(value.length>100) { 
                return "Please Enter a response Shorter than 100 Characters";
                }
              else {
                response.workForOrgPosition=value;
                return null;
                }
              }
              else{
                response.workForOrgPosition='';
                return null;
                }
            },
          ),  
        Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: 
                    Builder(
                      builder: (context) =>
                    RaisedButton(
                      onPressed: () {
                         if(_form6Key.currentState.validate()) {
                           try{
                             databaseReference.child("responses/"+uuid.v4()).set({
                              'memberType':response.memberType,
                              'title':response.title,
                              'fname':response.fname,
                              'lname':response.lname,
                              'dob':dateToString(response.dob),
                              'address':response.address,
                              'suburb':response.suburb,
                              'state':response.state,
                              'postcode':response.postcode,
                              'phone':response.phone,
                              'email':response.email,
                              'dogTrainedFor':response.dogTrainedFor,
                              'dogName':response.dogName,
                              'dogBreed':response.dogBreed,
                              'trainer':response.trainer,
                              'dogTrainedForOther':response.dogTrainedForOther,
                              'workForOrg':response.workForOrg.toString(),
                              'workForOrgName':response.workForOrgName,
                              'workForOrgPosition':response.workForOrgPosition,
                              }).then((value){controller.nextPage(duration: kTabScrollDuration,curve: Curves.ease);});
                              }
                            catch(e){Scaffold.of(context).showSnackBar(SnackBar(content: Text(e)));} 
                            }
                        },
                      child: Text("Submit"),
                      )),  
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
),),),
//page 10 start
SingleChildScrollView(child: 
Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Text("Success!",style: Theme.of(context).textTheme.display1),
      Text("Your application has been sent.\nOnce your membership application has been approved, there are two options for making your membership payment:\n"),
      ListTile(
        leading: Text("1."),
        title: Text('Pay by direct deposit, with an electronic funds transfer, bank account details.')),
      ListTile(
        leading: Text("2."),
        title: Text('Pay online using your PayPal account, or using your credit card, with secure PayPal, click on the Donate button below.')),
      RaisedButton(child: Text('Paypal button coming soon'),onPressed: (){},),

      
      Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () {   
                        Navigator.pop(context);
                        },
                      child: Text("Done"),
                      ),  
                    ),
                    // RaisedButton(
                    //   onPressed: (){
                    //     controller.previousPage(duration: kTabScrollDuration,curve: Curves.ease);
                    //     },
                    //   child: Text("Back (remove button after development)"),
                    //   )

      ],
    ),)
    ],))
;
  }
}
    