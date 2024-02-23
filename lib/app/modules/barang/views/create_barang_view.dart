import 'package:belajar_getx1/app/modules/barang/controllers/barang_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateBarangView extends GetView<BarangController> {
  CreateBarangView({super.key});

  BarangController barangController = Get.put(BarangController());

  var formKey = GlobalKey<FormState>();

  final TextEditingController nama = TextEditingController(),
      harga = TextEditingController(),
      deskripsi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Barang"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nama,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: "Nama barang",
                    hintText: "Masukkan nama barang . . .",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: harga,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: "Harga barang",
                    hintText: "Masukkan harga barang . . .",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: deskripsi,
                  maxLines: 3,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: "Deskripsi",
                    hintText: "Masukkan deskripsi barang . . .",
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    barangController.store({
                      'nama': nama.text,
                      'harga': harga.text,
                      'deskripsi': deskripsi.text,
                    });
                  },
                  child: Text("Tambah"),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
