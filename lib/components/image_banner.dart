import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Semantics(
              child: Image.asset('assets/images/logo.png'),
              label: "DGHA Logo",
            )
            
          ]),
    );
  }
}
