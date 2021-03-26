import './screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var _loading = false;
  Map<String, String> _loginData = {'email': '', 'password': ''};

  Future<void> loginUser() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _loading = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false)
          .loginUser(_loginData['email'], _loginData['password']);
    } catch (error) {
      print(error);
    }

    setState(() {
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
                  'Sign In',
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
                              return !value.contains('@')
                                  ? 'enter valid email'
                                  : null;
                            },
                            onSaved: (val) => _loginData['email'] = val,
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
                                  ? 'password is required'
                                  : null;
                            },
                            onSaved: (val) => _loginData['password'] = val,
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
                          onTap: loginUser,
                          child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 35,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: _loading
                                  ? CircularProgressIndicator()
                                  : Text('login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                      ))))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("create account?"),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Signup();
                          }));
                        },
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          height: 30,
                          child: Text('register',
                              style: TextStyle(color: Colors.white)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF32434F)),
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
