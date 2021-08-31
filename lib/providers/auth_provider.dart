import 'package:auntie_rafiki_appointments/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  //methods and properties for the authentication.

  final String userEmail = "peterabel2504@gmail.com";
  final String userPassword = "abednego";
  User? user;
  bool isLoggedIn = false;

  Future<bool> login({required String email, required String password}) async {
    isLoggedIn = false;
    notifyListeners();
    //log in function of the user
    if (email == userEmail && password == userPassword) {
      user = User(name: "peter", email: email);
      isLoggedIn = true;
    }
    notifyListeners();
    return isLoggedIn;
  }
}
