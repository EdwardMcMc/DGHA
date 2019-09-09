import 'package:flutter/material.dart';

class TranslatePopup extends StatefulWidget {
    TranslatePopup({Key key}) : super(key: key);

  @override
  _TranslatePopup createState() => _TranslatePopup();
}

class _TranslatePopup extends State<TranslatePopup> {
    String dropdownValue = 'One';
    @override
    Widget build(BuildContext context) {
      return SimpleDialog(
        title: const Text('Select Language'),
        children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          RaisedButton(
            child: Text("Translate"),
            onPressed: () {
              
            }
          )     
        ]
        
      );
  }
}