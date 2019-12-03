import 'package:dgha/screens/Home/membership/membership.dart';
import 'package:dgha/components/image_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
                  'Dog Guide Handlers Australia (DGHA) is an independent non profit association of dog guide handlers, and is not affiliated with any dog guide organisation.'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: ContainerPadding,
                    child: MaterialButton(
                      height: 40.0,
                      minWidth: 120.0,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => Membership()),
                        );
                      },
                      child: Text('Membership'),
                    ),
                  ),
                  Container(
                    padding: ContainerPadding,
                    child: MaterialButton(
                      height: 40.0,
                      minWidth: 120.0,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
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
                  ),
                ],
              ),
              TextSection('Key Objectives',
                  'DGHA draws on the experiences and varied knowledge of its members, to provide peer support, advocacy and information for dog guide handlers throughout Australia.'),
              TextSection("Background Information",
                  'Dog Guide Handlers Australia was formed in August 2009 by four passionate people who were inspired by similar groups which exist in other countries.\n\n'),
              TextSection.bodyOnly(
                  'DGHA was registered as an incorporated association in January 2011.\n'
                  'DGHA does not have a physical office, and we have no paid staff.\n'
                  'The DGHA Committee is a group of dedicated volunteers who meet regularly via teleconference.'),
            ]),
          ),
        ));
  }
}
