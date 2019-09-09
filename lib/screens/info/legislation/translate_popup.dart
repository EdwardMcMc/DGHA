import 'package:flutter/material.dart';

class TranslatePopup extends StatefulWidget {
    TranslatePopup({Key key}) : super(key: key);

  @override
  _TranslatePopup createState() => _TranslatePopup();
}

class _TranslatePopup extends State<TranslatePopup> {
    String dropdownValue = 'One';
    List<String> _languages = ['Mandarin', 'Arabic', 'Arabic', 'Vietnamese','Italian', 'Greek', 'Filipino', 'Hindi', 'Spanish', 'Punjabi', 'Persian', 'Korean', 'German', 'Nepali' ];
    String _selectedLanguage;

    @override
    Widget build(BuildContext context) {
      return SimpleDialog(
        title: const Text('Select Language'),
        children: <Widget>[
          DropdownButton<String>(
            hint: Text('Please choose a language'), 
            value: _selectedLanguage,
            onChanged: (String newValue) {
              setState(() {
                _selectedLanguage = newValue;
              });
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

            }
          )     
        ]
        
      );
  }
}