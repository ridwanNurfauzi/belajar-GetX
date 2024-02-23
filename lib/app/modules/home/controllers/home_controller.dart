import 'package:get/get.dart';
import '../../../providers/api.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
  @override
  void onInit() {
    super.onInit();
    currentIndex.value = 0;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
