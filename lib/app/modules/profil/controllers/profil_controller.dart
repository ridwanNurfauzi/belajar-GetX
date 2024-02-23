import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../providers/api.dart';

class ProfilController extends GetxController {
  var isLoading = true.obs;
  var user = {}.obs;

  Future<String> getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.get('token').toString();
  }

  Future fetctUserDetails() async {
    var apiUrl = '/profile';
    try {
      var token = await getToken();
      if (token == null) throw Exception('Token tidak ditemukan.');

      var headers = {
        'Authorization': 'Bearer $token',
      };
      var response = await http.get(
        Uri.parse(Api.baseUrl + apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        user.value = apiResponse;
      } else {
        throw Exception('Gagal memuat data user.');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetctUserDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future logout() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
    } catch (e) {
      print('Error : $e');
    } finally {
      Get.offAllNamed('/login');
    }
  }
}
