import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dgha/screens/Home/home.dart';
import 'package:dgha/screens/info/info.dart';
import 'package:dgha/screens/review/review_root.dart';
import 'components/image_banner.dart';
import 'components/text_section.dart';

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingState();
  }
}

class _LandingState extends State<Landing> {
  int _currentIndex = 0;
  List<Widget> _children=[
    Home(),
    Platform.isIOS||Platform.isAndroid ?ReviewRoot():Scaffold(
        appBar: AppBar(title: Text('Review Page Coming Soon')),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              ImageBanner(),
              TextSection("Review Page Coming Soon",
                  ''),
              ])))),
              Info()
  ];
  
    
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.rate_review),
            title: new Text('Review'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('Info'))
        ],
      ),
    );
  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
