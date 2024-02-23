import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: "Masukkan E-mail . . .",
                    ),
                    onChanged: (value) {
                      registerController.email.value = value;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama Depan',
                      hintText: "Masukkan Nama depan . . .",
                    ),
                    onChanged: (value) {
                      registerController.firstname.value = value;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama Belakang',
                      hintText: "Masukkan Nama belakang . . .",
                    ),
                    onChanged: (value) {
                      registerController.lastname.value = value;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: "Masukkan Password . . .",
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) {
                      registerController.password.value = value;
                    },
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        registerController.goToLogin();
                      },
                      child: Text(
                        "Sudah Punya akun?",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      registerController.register();
                    },
                    child: Text('Kirim'),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  // Obx(() => Text(
                  //     "${registerController.email}, ${registerController.firstname}, ${registerController.lastname}, ${registerController.password}"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
