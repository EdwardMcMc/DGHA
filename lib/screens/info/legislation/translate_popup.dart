import 'package:flutter/material.dart';

class TranslatePopup extends StatefulWidget {
    TranslatePopup({Key key}) : super(key: key);

  @override
  _TranslatePopup createState() => _TranslatePopup();
}

class _TranslatePopup extends State<TranslatePopup> {
    List<String> _languages = ['English', 'Arabic', 'Chinese (Simplified)', 'Chinese (Traditional)', 'German','Greek', 'Hindi', 'Italian', 'Korean',  'Nepali', 'Persian', 'Punjabi', 'Spanish','Filipino' ,'Vietnamese' ];
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
        ],
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        )
      );
  }
}