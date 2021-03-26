import 'package:flutter/material.dart';

class RequestItem extends StatelessWidget {
  final String status;
  RequestItem({this.status});

  Color get statusColor {
    Color color;
    switch (status) {
      case 'delivered':
        color = Color(0xFF9986B4);
        break;
      case 'placed':
        color = Color(0xFF235997);
        break;
      case 'accepted':
        color = Colors.blue;
        break;
      default:
        color = Colors.green;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.5, color: Color(0xFFAB967A)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFAB967A),
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF7ECDE),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Package Name',
                  style: TextStyle(color: Color(0xFFA88E6C)),
                ),
                Container(
                  width: 150,
                  child: Text(
                    'size:1x2x3',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  height: 20,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
