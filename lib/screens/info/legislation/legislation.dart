import 'package:dgha/data/act.dart';
import 'package:flutter/material.dart';
import 'package:dgha/data/nsw.dart';
import 'package:dgha/data/vic.dart';
import 'package:dgha/data/qld.dart';
import 'package:dgha/data/nt.dart';
import 'package:dgha/data/sa.dart';
import 'package:dgha/data/tas.dart';
import 'package:dgha/data/wa.dart';
import 'package:dgha/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dgha/screens/info/legislation/translate_popup.dart';

class Legislation extends StatefulWidget {
  const Legislation({ Key key, this.state}) : super(key: key);

  final String state;


  @override
  _Legislation createState() => _Legislation(state);
}
class _Legislation extends State<Legislation> {
  String _state;

  _Legislation(this._state);

  List<Widget> _renderLegislation(context) {
    dynamic state;
    switch (this._state) {
      case ('VIC'):
        state = VIC();

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
              Text(state.title, style: Theme.of(context).textTheme.headline),
              Text(state.legislation.first.title,
                  style: Theme.of(context).textTheme.title),
              Text(state.legislation.first.section,
                  style: Theme.of(context).textTheme.subhead),
              Text(state.legislation.first.link),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.legislation.first.body
                      .map<Widget>((legislation) =>
                          Text(legislation, textAlign: TextAlign.left))
                      .toList())
            ],
          )),
    ];
  }

  List<String> _states = ["VIC", "NSW", "QLD", "ACT", "SA", "NT", "WA", "TAS"];

  @override
  Widget build(BuildContext context) {

    // Fix state variable for android support
    switch(this._state) {
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
          title: DropdownButton<String>(
            value: _state,
            onChanged: (String newValue) {
              setState(() { _state = newValue; });
            },
            items: _states.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
          ),
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
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TranslatePopup();
                });
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ));
  }
}
