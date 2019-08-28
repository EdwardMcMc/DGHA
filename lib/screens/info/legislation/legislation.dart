import 'package:flutter/material.dart';
import 'package:dgha/data/vic.dart';
import 'package:dgha/style.dart';

class Legislation extends StatelessWidget {
  final String _state;

  Legislation(this._state);

  List<Widget> _renderLegislation(context) {
    dynamic state;
    switch (this._state) {
      case 'VIC':
        state = VIC();
        break;
      default:
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
                  children: state.legislation.first.body
                      .map<Widget>((legislation) => Text(legislation))
                      .toList())
            ],
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Legislation')),
      body: Container(
        child: Column(
          children: List.of(_renderLegislation(context)),
        ),
      ),
    );
  }
}
