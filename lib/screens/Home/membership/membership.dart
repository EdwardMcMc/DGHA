import 'package:flutter/material.dart';

class Membership extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Membership')),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Join DGHA \n", style: Theme.of(context).textTheme.title ),
              Text("To join DGHA, please complete the on-line membership form below. \n"),
              Text("The cost of membership to join DGHA is a once only payment, for lifetime membership. \n"),
              Text("Full Membership: \$20.00."),
              Text("Associate Membership: \$10.00. \n"),
              Text("We encourage employees of dog guide organisations to join, trainers, instructors and puppy raisers are welcome.")
            ]
          ),
        ));
  }
}
