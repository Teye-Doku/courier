import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;
  Timer _autoTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> registerUser(String name, String email, String password) async {
    final url = 'http://192.168.1.25:8000/users/register';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.post(url,
          body:
              json.encode({'name': name, 'email': email, 'password': password}),
          headers: headers);
      final responseData = response.body;
      print(responseData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> loginUser(String email, String password) async {
    final url = 'http://192.168.1.25:8000/users/login';
    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(url,
          body: json.encode({'email': email, 'password': password}),
          headers: headers);
      final responseBody = response.body;

      final responseData =
          jsonDecode(responseBody).cast<Map<String, dynamic>>();
      print(responseData);
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(responseData['token']);
      _token = responseData['token'];
      _userId = responseData['userId'];
      _expiryDate =
          DateTime.now().add(Duration(seconds: int.parse(decodedToken['exp'])));
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
          {'token': _token, 'userId': _userId, 'expiryDate': _expiryDate});
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedData = json.decode(prefs.getString('userData'));
    DateTime expiryDate = extractedData['expiryDate'];
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedData['token'];
    _userId = extractedData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  void _autoLogout() {
    if (_autoTimer != null) {
      _autoTimer.cancel();
    }
    final timeOut = _expiryDate.difference(DateTime.now()).inSeconds;
    _autoTimer = Timer(Duration(seconds: timeOut), logout);
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_autoTimer != null) {
      _autoTimer.cancel();
      _autoTimer = null;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
