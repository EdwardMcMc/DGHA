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

class Legislation extends StatelessWidget {
  final String _state;

  Legislation(this._state);

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
      case 'Victoria':
        state = VIC();
        break;
      case 'New South Wales':
        state = NSW();
        break;
      case 'Queensland':
        state = QLD();
        break;
      case 'Northern Territory':
        state = NT();
        break;
      case 'South Australia':
        state = SA();
        break;
      case 'Tasmania':
        state = TAS();
        break;
      case 'Western Australia':
        state = WA();
        break;
      case 'Australian Capital Territory':
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Legislation')),
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
     )
    )
    );
  }
}
