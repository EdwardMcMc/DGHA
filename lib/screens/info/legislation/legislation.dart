import 'package:dgha/data/markdown/act.dart';
import 'package:flutter/material.dart';
import 'package:dgha/data/markdown/nsw.dart';
import 'package:dgha/data/markdown/vic.dart';
import 'package:dgha/data/markdown/qld.dart';
import 'package:dgha/data/markdown/nt.dart';
import 'package:dgha/data/markdown/sa.dart';
import 'package:dgha/data/markdown/tas.dart';
import 'package:dgha/data/markdown/wa.dart';
import 'package:dgha/style.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Legislation extends StatefulWidget {
  const Legislation({Key key, this.state}) : super(key: key);

  final String state;

  @override
  _Legislation createState() => _Legislation(state);
}

class _Legislation extends State<Legislation> {
  String _state;

  List<String> languages = [
    'English',
    'Arabic',
    'Chinese (Simplified)',
    'Chinese (Traditional)',
    'Filipino',
    'German',
    'Greek',
    'Hindi',
    'Italian',
    'Korean',
    'Nepali',
    'Persian',
    'Punjabi',
    'Spanish',
    'Vietnamese'
  ];

  _Legislation(this._state);

  List<Widget> _renderLegislation(context) {
    dynamic state;
    switch (this._state) {
      case ('VIC'):
        state = new VIC();

        break;
      case 'NSW':
        state = NSW();
        break;
      case 'QLD':
        state = QLD();
        break;
      case 'NT':
        state = NT();
        break;
      case 'SA':
        state = SA();
        break;
      case 'TAS':
        state = TAS();
        break;
      case 'WA':
        state = WA();
        break;
      case 'ACT':
        state = ACT();
        break;
      default:
        state = VIC();
        break;
    }
    return [
      Container(
          padding: ContainerPadding,
          child: Column(
            children: <Widget>[
              MarkdownBody(data: state.translations[selectedIndex], onTapLink: (href){
                // Open in app browser
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => WebviewScaffold(
                      url:
                      href,
                      appBar: new AppBar(
                        title: new Text(href),
                      ),
                    ),
                  ),
                );
              },)
            ],
          )),
    ];
  }

  List<String> _states = ["VIC", "NSW", "QLD", "ACT", "SA", "NT", "WA", "TAS"];
  String selectedLanguage = "English";
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Fix state variable for android support
    switch (this._state) {
      case 'Victoria':
        _state = "VIC";
        break;
      case 'New South Wales':
        _state = "NSW";
        break;
      case 'Queensland':
        _state = "QLD";
        break;
      case 'Northern Territory':
        _state = "NT";
        break;
      case 'South Australia':
        _state = "SA";
        break;
      case 'Tasmania':
        _state = "TAS";
        break;
      case 'Western Australia':
        _state = "WA";
        break;
      case 'Australian Capital Territory':
        _state = "ACT";
        break;
    }

    // Give state a  Placeholder for dropdown default
    if (_state == null) {
      _state = "VIC";
    }

    return Scaffold(
        appBar: AppBar(
          title: 
            Semantics(
              child: DropdownButton<String>(
                hint: Text(
                  _state,
                  style: TextStyle(color: Colors.white),
                  
                ),
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
                //value: _state,
                onChanged: (String newValue) {
                  setState(() {
                    _state = newValue;
                  });
                },
                items: _states.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
              label: "Switch state",
            )
          
          
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: List.of(_renderLegislation(context)),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(FontAwesomeIcons.language),
          tooltip: "Translate legislation",
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext build) {
                  return SimpleDialog(
                    title: Text("Translate legislation"),
                    children: <Widget>[
                      DropdownButton<String>(
                        hint: Text('Please choose a language'),
                        value: selectedLanguage,
                        onChanged: (String newValue) {
                          switch (newValue) {
                            case 'English':
                              selectedIndex = 0;
                              break;
                            case 'Arabic':
                              selectedIndex = 1;
                              break;
                            case 'Chinese (Simplified)':
                              selectedIndex = 2;
                              break;
                            case 'Chinese (Traditional)':
                              selectedIndex = 3;
                              break;
                            case 'Filipino':
                              selectedIndex = 4;
                              break;
                            case 'German':
                              selectedIndex = 5;
                              break;
                            case 'Greek':
                              selectedIndex = 6;
                              break;
                            case 'Hindi':
                              selectedIndex = 7;
                              break;
                            case 'Italian':
                              selectedIndex = 8;
                              break;
                            case 'Korean':
                              selectedIndex = 9;
                              break;
                            case 'Nepali':
                              selectedIndex = 10;
                              break;
                            case 'Persian':
                              selectedIndex = 11;
                              break;
                            case 'Punjabi':
                              selectedIndex = 12;
                              break;
                            case 'Spanish':
                              selectedIndex = 13;
                              break;
                            case 'Vietnamese':
                              selectedIndex = 14;
                              break;
                            default:
                              selectedIndex = 0;
                              break;
                          }
                          Navigator.pop(context);
                          setState(() {
                            selectedLanguage = newValue;

                          });
                        },
                        items: <String>[
                          'English',
                          'Arabic',
                          'Chinese (Simplified)',
                          'Chinese (Traditional)',
                          'Filipino',
                          'German',
                          'Greek',
                          'Hindi',
                          'Italian',
                          'Korean',
                          'Nepali',
                          'Persian',
                          'Punjabi',
                          'Spanish',
                          'Vietnamese'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  )
                  );
                });
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ));
  }
}
