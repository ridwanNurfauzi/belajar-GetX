import 'package:belajar_getx1/app/modules/barang/controllers/barang_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBarangView extends GetView<BarangController> {
  EditBarangView({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    super.key,
  });

  BarangController barangController = Get.put(BarangController());

  var formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController(),
      hargaController = TextEditingController(),
      deskripsiController = TextEditingController();

  int id;
  var nama, harga, deskripsi;

  @override
  Widget build(BuildContext context) {
    namaController.text = nama.toString();
    hargaController.text = harga.toString();
    deskripsiController.text = deskripsi ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Barang"),
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
                  controller: namaController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: "Nama barang",
                    hintText: "Masukkan nama barang . . .",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: hargaController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: "Harga barang",
                    hintText: "Masukkan harga barang . . .",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: deskripsiController,
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
                    barangController.edit({
                      'nama': namaController.text,
                      'harga': hargaController.text,
                      'deskripsi': deskripsiController.text,
                    }, id);
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
