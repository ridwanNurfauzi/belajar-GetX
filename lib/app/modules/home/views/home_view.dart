import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/profil");
              },
              child: Text("Profil"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/counter");
              },
              child: Text("Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/biodata");
              },
              child: Text("Biodata"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/invoice");
              },
              child: Text("Invoice"),
            ),
          ],
        ),
      ),
    );
  }
}
