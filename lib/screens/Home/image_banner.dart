import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Image.asset('assets/images/logo.png')]),
    );
  }
}
