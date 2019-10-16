import 'package:flutter/material.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({ Key key }) : super(key: key);

  @override
  _ReviewForm createState() => _ReviewForm();
}

class _ReviewForm extends State<ReviewForm> {
  bool isPressed = false;
  int numPressed = 0;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Review')),
     body: Column(
       children: [
        Row(children: [
          IconButton(
            icon:
              (numPressed == 0) ? Icon(Icons.star_border) : Icon(Icons.star),
            color: 
              (numPressed == 0) ? Colors.grey : Colors.yellow,
            iconSize: 50,
            onPressed: () {
              
              setState(() {
                numPressed = 1;                
              });
            },
          ),
           IconButton(
            icon:
              (numPressed <= 1) ? Icon(Icons.star_border) : Icon(Icons.star),
            color: 
              (numPressed <= 1) ? Colors.grey : Colors.yellow,
            iconSize: 50,
            onPressed: () {
              setState(() {
                numPressed = 2;                
              });
            },
          ),
            IconButton(
            icon:
              (numPressed <= 2) ? Icon(Icons.star_border) : Icon(Icons.star),
            color: 
              (numPressed <= 2) ? Colors.grey : Colors.yellow,
            iconSize: 50,
            onPressed: () {
              setState(() {
                numPressed = 3;                
              });
            },
          ),
            IconButton(
            icon:
              (numPressed <= 3) ? Icon(Icons.star_border) : Icon(Icons.star),
            color: 
              (numPressed <= 3) ? Colors.grey : Colors.yellow,
            iconSize: 50,
            onPressed: () {
              setState(() {
                numPressed = 4;                
              });
            },
          ),
             IconButton(
            icon:
              (numPressed <= 4) ? Icon(Icons.star_border) : Icon(Icons.star),
            color: 
              (numPressed <= 4) ? Colors.grey : Colors.yellow,
            iconSize: 50,
            onPressed: () {
              setState(() {
                numPressed = 5;                
              });
            },
          ),
          ]
        ),
         
        

       ],
     )
     
     
   );
 }

 
}