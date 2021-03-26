import 'package:flutter/material.dart';
import './screens.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF32434F),
          title: Text('Select Parcel', style: TextStyle(fontSize: 15)),
        ),
        body: ClipPath(
          clipper: ParcelClipper(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return CategoryDetail();
                            }));
                          },
                          child: Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xFFF7ECDE),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFAB967A),
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Text(
                              'Parcel',
                              style: TextStyle(
                                  color: Color(0xFFF7ECDE),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFF7ECDE),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFAB967A),
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Document',
                            style: TextStyle(
                                color: Color(0xFFF7ECDE),
                                fontWeight: FontWeight.w900,
                                fontSize: 18),
                          ),
                          alignment: Alignment.center,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

class ParcelClipper extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height));
    radius:
    Radius.elliptical(10, 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
