import 'dart:convert';

import 'package:belajar_getx1/app/data/models/barang_model.dart';
import 'package:belajar_getx1/app/modules/barang/views/show_barang_view.dart';
import 'package:belajar_getx1/app/providers/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BarangController extends GetxController {
  var barangList = <Barang>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> store(Map<String, String> data) async {
    try {
      var response = await _performStore(data);
      var responseBody = json.decode(response.body);
      if (response.statusCode == 201) {
        await fetchData();
        Get.snackbar('Berhasil', 'Berhasil menambahkan data.');
        Get.offNamed('/barang');
      } else {
        Get.snackbar('Error', 'Gagal menambah barang.');
      }
    } catch (e) {
      print('error: $e');
    }
  }

  Future<void> edit(Map<String, String> data, int id) async {
    try {
      var response = await _performEdit(data, id);
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        await fetchData();
        Get.snackbar('Berhasil', 'Berhasil mengubah data.');
        Get.offNamed('/barang');
      } else {
        Get.snackbar('Error', 'Gagal mengubah barang.');
      }
    } catch (e) {
      print('error: $e');
    }
  }

  Future<http.Response> _performStore(Map<String, String> data) async {
    var route = '/barang';
    var requestBody = data;

    final uri = Uri.parse(Api.baseUrl + route);
    var request = http.MultipartRequest('POST', uri);

    request.fields.addAll(requestBody);
    request.headers.addAll(await Api.getHeaders());

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }

  Future<http.Response> _performEdit(Map<String, String> data, int id) async {
    var route = '/barang/$id';
    var requestBody = data;

    final uri = Uri.parse(Api.baseUrl + route);
    var request = http.MultipartRequest('PUT', uri);

    request.fields.addAll(requestBody);
    request.headers.addAll(await Api.getHeaders());

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }

  Future<void> showById(int id) async {
    try {
      var apiUrl = '${Api.baseUrl}/barang/$id';
      var headers = await Api.getHeaders();

      var _temp = <Barang>[];

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['data'];
        _temp.assignAll(jsonResponse.map((model) => Barang.fromJson(model)));
        var data = _temp[0];
        print(data.id);
        Get.to(() => ShowBarangView(
              id: data.id,
              nama: data.nama,
              harga: data.harga,
              deskripsi: data.deskripsi,
            ));
      } else {
        throw Exception('Gagal memuat data barang.');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/barang';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['data'];
        barangList
            .assignAll(jsonResponse.map((model) => Barang.fromJson(model)));
      } else {
        throw Exception('Gagal memuat data barang.');
      }
    } catch (e) {
      print('Gagal memuat data barang. {$e}');
    }
  }

  Future<void> deleteBarang(Barang barang) async {
    try {
      var apiUrl = '${Api.baseUrl}/barang/${barang.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Barang berhasil dihapus');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete barang');
      }
    } catch (e) {
      print('Error during delete barang: $e');
    }
  }
}
