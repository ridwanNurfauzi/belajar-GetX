import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;
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

  void increment() {
    if (count.value >= 20) {
      Get.snackbar("title", "Kebanyakan");
    } else
      count.value++;
  }
  void decrement() {
    if (count.value <= 1) {
      Get.snackbar("title", "!!!");
    } else
      count.value--;
  }
}
