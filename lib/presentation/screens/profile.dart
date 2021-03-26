import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 70,
          width: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Color(0xFFAB967A)),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/riderhead.jpg',
                      ),
                      fit: BoxFit.contain),
                ),
                child: Placeholder(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Emmanuel Teye',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                    Text('123456', style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 150,
          width: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFAB967A),
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.support,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Support',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(Icons.logout, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    'Log Out',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
