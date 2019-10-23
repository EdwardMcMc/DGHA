import 'package:flutter/material.dart';

class ReviewForm extends StatefulWidget {

  @override
  _ReviewForm createState() => _ReviewForm();
}

class _ReviewForm extends State<ReviewForm> {
int locRating = 0;
int amenRating = 0;
int custRating = 0;
bool didTrySubmit = false;
final _formKey = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Review',)),
    body: SingleChildScrollView(
      child: Form(
      key: _formKey,
      child:Column(
        children: [
            Text(
               "Location",
               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            ),
          
          
          Row(children: [
            
            for(int i=1; i<=5; i++)
              IconButton(
                icon:
                  (locRating < i) ? Icon(Icons.star_border) : Icon(Icons.star),
                color: 
                  (locRating < i) ? Colors.grey : Colors.yellow,
                iconSize: 50,
                tooltip: "Location $i stars",
                onPressed: () {
                  setState(() {
                    locRating = i;                           
                  });
                },
              ),
              ]
            ),
          if(didTrySubmit && locRating == 0)
            Align(
              alignment: Alignment.centerLeft,
              child:Text(
              "Please select a star rating",
              style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          Text(
               "Amenities",
               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            ),
          Row(children: [
            for(int i=1; i<=5; i++)
              IconButton(
                icon:
                  (amenRating < i) ? Icon(Icons.star_border) : Icon(Icons.star),
                color: 
                  (amenRating < i) ? Colors.grey : Colors.yellow,
                iconSize: 50,
                tooltip: "Amenities $i stars",
                onPressed: () {
                  setState(() {
                    amenRating = i;
                  });
                },
              ),
            ],
          ),
          if(didTrySubmit && amenRating == 0)
          Align(
            alignment: Alignment.centerLeft,
            child:Text(
            "Please select a star rating",
            style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
          Text(
               "Customer Service",
               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
            ),
          
          Row(children: [
            for(int i=1; i<=5; i++)
              IconButton(
                icon:
                  (custRating < i) ? Icon(Icons.star_border) : Icon(Icons.star),
                color: 
                  (custRating < i) ? Colors.grey : Colors.yellow,
                iconSize: 50,
                tooltip: "Customer Service $i stars",
                onPressed: () {
                  setState(() {
                    custRating = i;
                  });
                },
              ),
            ],
          ),
          if(didTrySubmit && custRating == 0)
          Align(
            alignment: Alignment.centerLeft,
            child:Text(
            "Please select a star rating",
            style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
          Text(
              "Other Thoughts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
          ),
          TextFormField(
            validator: (value){
              if (value.isEmpty){
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "dart is good"
            ),
          ),
          RaisedButton(
            onPressed: (){
              setState(() {
                didTrySubmit = true;
              });

            if (_formKey.currentState.validate()&& locRating != 0 && amenRating != 0 && custRating !=0){
              Scaffold
                .of(context)
                .showSnackBar (SnackBar(content: Text('Processing Data'),));
              }
            },
            child: Text('Submit'),
          )
        ],
      )
    ),
    )
   );
 }
}