import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:kortoba_assign/model/register_model.dart';
import 'package:kortoba_assign/res/app_constants.dart';

import '../data/network/network_api_service.dart';
import '../model/login_model.dart';
import '../res/app_url.dart';

class AuthRepositry {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<LoginModel> login(email, pass) async {
    try {
      print(AppUrl.login);

      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.login, json.encode({"username": email, "password": pass}));
      print('response $response');
      return LoginModel.fromJson(response);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      rethrow;
    }
  }

  Future<RegisterModel> signup(
      email, pass, firstName, lastName, userName) async {
    try {
      print(AppUrl.register);

      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.register,
          json.encode({
            "username": userName,
            "password": pass,
            "email": email,
            "first_name": firstName,
            "last_name": lastName
          }));
      print('response $response');
      return RegisterModel.fromJson(response);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConstants.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      rethrow;
    }
  }
}
