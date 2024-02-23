import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            // controller.changePage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Pasien',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/my_icon.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/profil");
              },
              child: Text("Profil"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/barang");
              },
              child: Text("Barang"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/counter");
              },
              child: Text("Counter"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/biodata");
              },
              child: Text("Biodata"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/invoice");
              },
              child: Text("Invoice"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/login");
              },
              child: Text("Login"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/register");
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
