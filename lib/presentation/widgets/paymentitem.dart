import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.5, color: Color(0xFFAB967A)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFAB967A),
            blurRadius: 2,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Package Name',
            style: TextStyle(color: Color(0xFFA88E6C)),
          ),
          Container(
            child: Text(
              'amount: C 100',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'paid',
              style: TextStyle(color: Colors.blueAccent),
            ),
          )
        ],
      ),
    );
  }
}
