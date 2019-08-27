import 'package:flutter/material.dart';

class Access extends StatelessWidget {
  final String _state;
  static const double _hPad = 20.0;
  static const double _vPad = 15.0;

  Access(this._state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Access for guide dogs')),
        body: Container(
          child: Column(
            children: <Widget>[
              Text('Legal obligations',
                  style: Theme.of(context).textTheme.title),
              Container(
                  child: Text(
                      'In line with Victorian State Laws, a person with low vision accompanied by a Guide Dog is permitted to:')),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: _hPad, vertical: _vPad),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text(
                          'Travel on any form of public transport, including taxis, buses, trams and trains'),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text('Enter any public place'),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text('Visit any theatre'),
                    ),
                    ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text('Eat in any restaurant')),
                    ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text(
                            'Shop in any store (including supermarkets and food stores'))
                  ],
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: _hPad, vertical: _vPad),
                  child: Text(
                      'The only exceptions where a Guide Dog is not permitted are operating theatres, commercial kitchens and some parts of the zoo.')),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: _hPad, vertical: _vPad),
                  child: Text(
                      'It is generally discriminatory and unlawful for anyone to attempt to deny these rights to a person with low vision, or treat that person less favourably, solely because he or she is accompanied by a Guide Dog.')),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: _hPad, vertical: _vPad),
                  child: Text(
                      'These laws also apply to people training Guide Dogs and Guide Dog puppies.'))
            ],
          ),
        ));
  }
}
