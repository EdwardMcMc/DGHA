//this was made by edward to test out the translation popup without messing everything up
import 'package:flutter/material.dart';

Future<int> asyncInputDialog(BuildContext context) async {
  int index=0;
  List<String> _languages = ['English', 'Arabic', 'Chinese (Simplified)', 'Chinese (Traditional)','ahas' , 'German','Greek', 'Hindi', 'Italian', 'Korean',  'Nepali', 'Persian', 'Punjabi', 'Spanish','Vietnamese' ];
  String _selectedLanguage='English';
  return showDialog<int>(
    context: context,
    //barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return 
      SimpleDialog(
        
        title: const Text('Select Language'),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        children: <Widget>[
          
          DropdownButton<String>(
            hint: Text('Please choose a language'), 
            value: _selectedLanguage,
            onChanged: (String newValue) {
                _selectedLanguage = newValue;  
                           
            },
            items: _languages.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
          ),
          RaisedButton(
            child: Text("Translate"),
            onPressed: () {
               switch(_selectedLanguage) {
                case 'English':
                  index = 0;
                  break;
                case 'Arabic':
                  index = 1;
                  break;
                case 'Chinese (Simplified)':
                  index = 2;
                  break;
                case 'Chinese (Traditional)':
                  index = 3;
                  break;
                case 'Filipino':
                  index = 4;
                  break;
                case 'German':
                  index = 5;
                  break;
                case 'Greek':
                  index = 6;
                  break;
                case 'Hindi':
                  index = 7;
                  break;
                case 'Italian':
                  index = 8;
                  break;
                case 'Korean':
                  index = 9;
                  break;
                case 'Nepali':
                  index = 10;
                  break;
                case 'Persian':
                  index = 11;
                  break;
                case 'Punjabi':
                  index = 12;
                  break;
                case 'Spanish':
                  index = 13;
                  break;
                case 'Vietnamese':
                  index = 14;
                  break;
                default:
                  index=0;
                  break;
                }
                Navigator.pop(context,index);
            })     
        ],
        
      );
      // AlertDialog(
      //   title: Text('Enter current team'),
      //   content: new Row(
      //     children: <Widget>[
      //       new Expanded(
      //           child: new TextField(
      //         autofocus: true,
      //         decoration: new InputDecoration(
      //             labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
      //         onChanged: (value) {
      //           teamName = value;
      //         },
      //       ))
      //     ],
      //   ),
      //   actions: <Widget>[
      //     FlatButton(
      //       child: Text('Ok'),
      //       onPressed: () {
      //         Navigator.of(context).pop(teamName);
      //       },
      //     ),
      //   ],
      // );
    },
  );
}