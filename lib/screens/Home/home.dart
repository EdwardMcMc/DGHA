import 'membership/membership.dart';
import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../form/form.dart';

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
                        "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=info@gmg.cm&lc=AU&item_name=Donations+or+Membership+Fee+or+Conference+Registration&no_note=0&cn=&currency_code=AUD&bn=PP-DonationsBF:btn_donateCC_LG.gif:NonHosted",
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
