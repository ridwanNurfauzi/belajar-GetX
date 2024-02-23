import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    _isLoggedin().then((isloggedin) {
      _hasToken().then((hasToken) {
        if(!isloggedin || !hasToken){
          Get.offNamed('/login');
        }
      });
    });
  }

  Future<bool> _isLoggedin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    return token != null;
  }

  Future<bool> _hasToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    return token != null;
  }
}
