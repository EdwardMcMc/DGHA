import 'membership/membership.dart';
import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../form/form.dart';
import 'package:dgha/style.dart';
import 'package:dgha/components/text_section.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              ImageBanner(),
              TextSection("About Dog Guide Handlers Australia",
                  'Dog Guide Handlers Australia (DGHA) is an independent non profit association of dog guide handlers, and is not affiliated with any dog guide organisation.'
              ),
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
              Container(
                padding: TitlePadding,
                child: Text(
                  "Key Objectives",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: Body1Padding,
                child: Text(
                  'DGHA draws on the experiences and varied knowledge of its members, to provide peer support, advocacy and information for dog guide handlers throughout Australia.',
                  style: Theme.of(context).textTheme.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: TitlePadding,
                child: Text(
                  "Background Information",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: Body1Padding,
                child: Text(
                  'Dog Guide Handlers Australia was formed in August 2009 by four passionate people who were inspired by similar groups which exist in other countries.\n\n'
                  'DGHA was registered as an incorporated association in January 2011.\n'
                  'DGHA does not have a physical office, and we have no paid staff.\n'
                  'The DGHA Committee is a group of dedicated volunteers who meet regularly via teleconference.',
                  style: Theme.of(context).textTheme.body1,
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
        ));
  }
}
