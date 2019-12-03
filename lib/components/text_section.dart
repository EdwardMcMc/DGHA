import 'package:flutter/material.dart';
import 'package:dgha/style.dart';

class TextSection extends StatefulWidget {
  String _title;
  final String _body;

  TextSection(this._title, this._body);
  TextSection.bodyOnly(this._body);

  @override
  _TextSectionState createState() => _TextSectionState();
}

class _TextSectionState extends State<TextSection> {
  @override
  Widget build(BuildContext context) {
    if (widget._title == null) {
      return Column (
        children: <Widget>[
          Container(
            padding: Body1Padding,
            child: Text(
              widget._body,
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
              widget._title,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: Body1Padding,
            child: Text(
              widget._body,
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

  }
}
