import 'package:flutter/material.dart';

class User with ChangeNotifier{
  String _firstName = "";
  String _lastName = "";
  String _userName = "";
  String _password = "";
  String _dob = "";
  String _email = "";

String get firstName => _firstName;
String get lastName => _lastName;
String get userName => _userName;
String get password => _password;
String get dob => _dob;
String get email => _email;
  
  set firstName(String firstName) {
    _firstName = firstName;
      notifyListeners();
  }
  set lastName(String lastName) {
    _lastName = lastName;
    notifyListeners();

  }
  set userName(String userName){
    _userName = userName;
    notifyListeners();
  }
  set password(String password){
    _password = password;
    notifyListeners();

  }
  set dob(String dob){
    _dob = dob;
    notifyListeners();
  }
  set email(String email){
    _email = email;
    notifyListeners();
  }


}

