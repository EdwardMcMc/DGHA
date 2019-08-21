import 'Donation/donation.dart';
import 'membership/membership.dart';
import 'image_banner.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Container(
        child: Column(children: [
          ImageBanner(),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => Membership()),
              );
            },
            child: Text('Membership'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => Donation()),
              );
            },
            child: Text('Donate'),
          ),
        ]),
      ),
    );
  }
}
