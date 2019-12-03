import 'package:flutter/material.dart';
import 'package:dgha/screens/info/legislation/legislation.dart';
import 'package:dgha/utils/geolocator.dart';
import 'package:dgha/style.dart';
import 'package:dgha/data/markdown/access.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Info extends StatelessWidget {
  final Geolocation _geolocation = Geolocation();
  final Access access  = Access();

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
                      builder: (context) => Legislation(state: _geolocation.state),
                    ));
              },
              child: Text('Legislation'))),
      appBar: AppBar(title: Text('Access for guide dogs')),
      body: SingleChildScrollView(
        child: Container(
          padding: ContainerPadding,
          child: MarkdownBody(data: access.english,),
        ),
      ),
    );
  }
}
