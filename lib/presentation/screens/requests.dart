import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      RequestItem(
        status: 'placed',
      ),
      RequestItem(status: 'placed'),
      RequestItem(status: 'delivered'),
      RequestItem(status: 'accepted'),
      RequestItem(status: 'accepted'),
      RequestItem(status: 'placed'),
    ]);
  }
}
