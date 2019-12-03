import 'package:flutter/material.dart';
import 'package:dgha/style.dart';
import 'package:dgha/screens/Form/form.dart';

class Membership extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10.0),
          child: MaterialButton(
            height: 40.0,
            minWidth: 200.0,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => MyCustomForm()),
              );
            },
            child: Text('Sign Up Now'),
          )),
      appBar: AppBar(title: Text('Membership')),
      body: Column(children: <Widget>[
        Container(
            padding: ContainerPadding,
            child: Text("Join DGHA", style: Theme.of(context).textTheme.title)),
        Container(
            padding: ContainerPadding,
            child: Text(
                "To join DGHA, please complete the on-line membership form below.")),
        Container(
          padding: ContainerPadding,
          child: Text(
              "The cost of membership to join DGHA is a once only payment, for lifetime membership."),
        ),
        Container(
          padding: ContainerPadding,
          child: Text("Full Membership: \$20.00."),
        ),
        Container(
          padding: ContainerPadding,
          child: Text("Associate Membership: \$10.00."),
        ),
        Container(
          padding: ContainerPadding,
          child: Text(
              "We encourage employees of dog guide organisations to join, trainers, instructors and puppy raisers are welcome."),
        ),
      ]),
    );
  }
}
