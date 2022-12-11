import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kortoba_assign/view/home/bottom_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repositry/auth_repositry.dart';
import '../res/app_constants.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepositry();

  isFieldValid(String txt) {
    if (txt.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> loginApi(BuildContext context, email, password) async {
    await _authRepo.login(email, password).then((value) async {
      print(value);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', 'JWT ${value.access}');
      prefs.setBool('logged', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeNavigator()));
      // setLogin(ApiResponse.completed(value));
    });
  }

  Future<void> registerApi(BuildContext context, email, password, username,
      firstname, lastname) async {
    await _authRepo
        .signup(email, password, firstname, lastname, username)
        .then((value) async {
      Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
      // setLogin(ApiResponse.completed(value));
    });
  }
}
