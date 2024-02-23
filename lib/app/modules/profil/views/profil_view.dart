import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  ProfilView({Key? key}) : super(key: key);
  ProfilController profilController = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfilView'),
          centerTitle: true,
        ),
        body: Obx(
          () => profilController.isLoading.value
              ? Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Loading...'),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                              'Email: ${profilController.user.value['data']['email']}'),
                          Text(
                              'Nama Depan: ${profilController.user.value['data']['firstname']}'),
                          Text(
                              'Nama Belakang: ${profilController.user.value['data']['lastname'] != null ? profilController.user.value['data']['lastname'] : ''}'),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              profilController.logout();
                            },
                            child: Text('Logout'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
