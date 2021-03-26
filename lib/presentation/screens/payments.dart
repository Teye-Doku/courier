import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Payments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PaymentItem(),
          PaymentItem(),
          PaymentItem(),
          PaymentItem(),
          PaymentItem(),
        ],
      ),
    );
  }
}
