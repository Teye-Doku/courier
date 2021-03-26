import 'package:flutter/material.dart';
import './screens.dart';

class CategoryDetail extends StatefulWidget {
  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Enter Parcel Size And Weight',
            style: TextStyle(fontSize: 15),
          ),
          backgroundColor: Color(0xFF32434F),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Please enter the parcel height in cm',
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Raleway",
                                  fontSize: 14),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text('Enter the height in cm',
                              style: TextStyle(color: Color(0xFF32434F)))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Please enter parcel width in cm',
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Raleway",
                                  fontSize: 14),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text('Enter the width in cm',
                              style: TextStyle(color: Color(0xFF32434F)))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Please enter parcel depth in cm',
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Raleway",
                                  fontSize: 14),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text('Enter the depth in cm',
                              style: TextStyle(color: Color(0xFF32434F)))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Please enter parcel weight in kg',
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Raleway",
                                  fontSize: 14),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text('Enter the weight in kg',
                              style: TextStyle(color: Color(0xFF32434F)))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xFF32434F),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text('Back',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ParcelInfo();
                              }));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xFF32434F),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text('Continue',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
