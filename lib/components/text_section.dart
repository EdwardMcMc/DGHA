import 'package:flutter/material.dart';
import 'package:dgha/style.dart';

class TextSection extends StatelessWidget {
  String _title;
  final String _body;

  TextSection(this._title, this._body);
  TextSection.bodyOnly(this._body);

  @override
  Widget build(BuildContext context) {
    if (_title == null) {
      return Column (
        children: <Widget>[
          Container(
            padding: Body1Padding,
            child: Text(
              _body,
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
    else  {
       return Column (
        children: <Widget>[
          Container(
            padding: TitlePadding,
            child: Text(
              _title,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: Body1Padding,
            child: Text(
              _body,
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

  }
}
