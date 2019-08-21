import 'package:flutter/material.dart';

import 'screens/Home/home.dart';
import 'screens/info/info.dart';
import 'screens/review/review.dart';

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingState();
  }
}

class _LandingState extends State<Landing> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    Review(),
    Info(),
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
