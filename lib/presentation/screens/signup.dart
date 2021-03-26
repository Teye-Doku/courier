import 'package:flutter/material.dart';
import '../../providers/auth.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _loading = false;
  final _formKey = new GlobalKey<FormState>();
  Map<String, String> _signUpData = {'name': '', 'email': '', 'password': ''};

  Future<void> registerUser() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    this.setState(() {
      _loading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).registerUser(
          _signUpData['name'], _signUpData['email'], _signUpData['password']);
    } catch (error) {
      print(error);
    }

    this.setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF32434F),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color(0xFF32434F),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: 300,
                          child: TextFormField(
                            validator: (value) {
                              return value.length == 0
                                  ? 'name must not be empty'
                                  : null;
                            },
                            onSaved: (val) => _signUpData['name'] = val,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              prefixIcon: Icon(Icons.person),
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Raleway",
                                  fontSize: 14),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
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
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: 300,
                          child: TextFormField(
                            validator: (value) {
                              return !value.contains('@')
                                  ? 'enter valid email'
                                  : null;
                            },
                            onSaved: (val) => _signUpData['email'] = val,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Raleway",
                                  fontSize: 14),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          width: 300,
                          child: TextFormField(
                            validator: (value) {
                              return value.length == 0
                                  ? 'password must not be empty'
                                  : null;
                            },
                            onSaved: (val) => _signUpData['password'] = val,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Raleway",
                                  fontSize: 14),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
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
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: registerUser,
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: _loading
                                ? CircularProgressIndicator()
                                : Text('register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                    )),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
