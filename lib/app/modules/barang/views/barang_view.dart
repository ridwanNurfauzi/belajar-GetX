import 'package:belajar_getx1/app/data/models/barang_model.dart';
import 'package:belajar_getx1/app/modules/barang/views/create_barang_view.dart';
import 'package:belajar_getx1/app/modules/barang/views/edit_barang_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/barang_controller.dart';

NumberFormat formatCurrency =
    new NumberFormat.currency(locale: 'id_ID', symbol: "Rp. ");

class BarangView extends GetView<BarangController> {
  BarangView({Key? key}) : super(key: key);

  final BarangController barangController = Get.put(BarangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BarangView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/barang/create');
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Obx(
        () => barangController.barangList.isEmpty
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent))
            : Container(
                child: ListView.builder(
                  itemCount: barangController.barangList.length + 1,
                  itemBuilder: (context, i) {
                    var index = i - 1;
                    if (index == -1) {
                      return ListTile(
                        title: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'nama',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                              child: Text(
                                'harga',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      var barang = barangController.barangList[index];
                      return ListTile(
                        title: Row(
                          children: [
                            Expanded(child: Text(barang.nama)),
                            Expanded(
                                child:
                                    Text(formatCurrency.format(barang.harga))),
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.to(() => EditBarangView(
                                            id: barang.id,
                                            nama: barang.nama,
                                            harga: barang.harga,
                                            deskripsi: barang.deskripsi,
                                          ));
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDeleteConfirmation(context, barang);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          barangController.showById(barang.id);
                        },
                      );
                    }
                  },
                ),
              ),
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context, Barang barang) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus barang'),
          content: Text('Apakah anda yakin ingin menghapus ${barang.nama}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteBarang(barang);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
