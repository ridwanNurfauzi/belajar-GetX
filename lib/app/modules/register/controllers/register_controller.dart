import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var firstname = ''.obs;
  var lastname = ''.obs;
  var password = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> register() async {
    try {
      var response = await _performRegister();
      var responseBody = json.decode(response.body);

      print('$responseBody');

      if (response.statusCode == 200 && responseBody['success']) {
        Get.snackbar('register Berhasil', '');
        Get.offNamed('/login');
      } else
        Get.snackbar('Error', 'Register Gagal');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<http.Response> _performRegister() async {
    var apiUrl = '/register';
    var requestBody = <String, String>{
      'email': email.value,
      'firstname': firstname.value,
      'lastname': lastname.value,
      'password': password.value,
    };

    final uri = Uri.parse(Api.baseUrl + apiUrl);
    var request = http.MultipartRequest('POST', uri);

    request.fields.addAll(requestBody);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }

  void goToLogin() {
    Get.toNamed('/login');
  }
}
