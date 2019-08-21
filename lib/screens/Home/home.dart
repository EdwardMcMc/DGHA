import 'Donation/donation.dart';
import 'membership/membership.dart';
import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
                MaterialPageRoute<void>(
                  builder: (context) => WebviewScaffold(
                    url:
                        "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&hosted_button_id=V9QDH2K4GLHJQ",
                    appBar: new AppBar(
                      title: new Text("Donate"),
                    ),
                  ),
                ),
              );
            },
            child: Text('Donate'),
          ),
        ]),
      ),
    );
  }
}
