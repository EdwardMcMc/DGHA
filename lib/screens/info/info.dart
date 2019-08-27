import 'package:flutter/material.dart';
import 'legislation/legislation.dart';
import 'package:dgha/utils/geolocator.dart';
import 'package:dgha/style.dart';

class Info extends StatelessWidget {
  final Geolocation _geolocation = Geolocation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10.0),
          child: MaterialButton(
              height: 40.0,
              minWidth: 200.0,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => Legislation(_geolocation.state),
                    ));
              },
              child: Text('Legislation'))),
      appBar: AppBar(title: Text('Access for guide dogs')),
      body: SingleChildScrollView(
        child: Container(
          padding: ContainerPadding,
          child: Column(
            children: <Widget>[
              Container(
                padding: ContainerPadding,
                child: Text('Legal obligations',
                    style: Theme.of(context).textTheme.title),
              ),
              Container(
                  child: Text(
                      'In line with Victorian State Laws, a person with low vision accompanied by a Guide Dog is permitted to:')),
              Container(
                padding: ContainerPadding,
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
                  padding: ContainerPadding,
                  child: Text(
                      'The only exceptions where a Guide Dog is not permitted are operating theatres, commercial kitchens and some parts of the zoo.')),
              Container(
                  padding: ContainerPadding,
                  child: Text(
                      'It is generally discriminatory and unlawful for anyone to attempt to deny these rights to a person with low vision, or treat that person less favourably, solely because he or she is accompanied by a Guide Dog.')),
              Container(
                  padding: ContainerPadding,
                  child: Text(
                      'These laws also apply to people training Guide Dogs and Guide Dog puppies.')),
            ],
          ),
        ),
      ),
    );
  }
}
