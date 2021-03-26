import 'package:flutter/material.dart';
import 'screens.dart';

class CourierHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF32434F),
          title: Text('Koscourier',
              style: TextStyle(color: Colors.white, fontSize: 15)),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              color: Color(0xFFF7ECDE),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Welcome to koscourier service,Emma',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF7ECDE)),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      margin: EdgeInsets.all(5),
                      height: 150,
                      child: Image.asset(
                        'assets/images/motor.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      margin: EdgeInsets.all(5),
                      height: 150,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text('Get Your Delivery on Time',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w900)),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text('A better pickup',
                                    style: TextStyle(color: Color(0xFFAB967A))),
                                Text('&',
                                    style: TextStyle(color: Color(0xFFAB967A))),
                                Text('Delivery Service',
                                    style: TextStyle(color: Color(0xFFAB967A)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CategoryPage();
                }));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 110,
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
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/riderhead.jpg')),
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
                            height: 25,
                          ),
                          Text(
                            'Send Packages',
                            style: TextStyle(color: Color(0xFFA88E6C)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              'Send packages to anywhere and anytime',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ClipPath(
              clipper: ContainerClipper(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width - 20,
                height: 150,
                color: Color(0xFFAB967A),
              ),
            )
          ],
        ));
  }
}

class ContainerClipper extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height));
    radius:
    Radius.elliptical(10, 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
