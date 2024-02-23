import 'package:belajar_getx1/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: loginController.formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: "Masukkan E-mail . . .",
                    ),
                    onChanged: (value) {
                      loginController.onEmailChanged(value);
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
                      loginController.onPasswordChanged(value);
                    },
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        loginController.goToRegister();
                      },
                      child: Text(
                        "Belum Punya akun?",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      loginController.login();
                    },
                    child: Text('Kirim'),
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
