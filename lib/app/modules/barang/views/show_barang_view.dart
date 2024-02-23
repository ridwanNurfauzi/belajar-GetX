import 'package:belajar_getx1/app/modules/barang/controllers/barang_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

NumberFormat formatCurrency =
    new NumberFormat.currency(locale: 'id_ID', symbol: "Rp. ");

class ShowBarangView extends GetView<BarangController> {
  ShowBarangView({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    super.key,
  });

  int id;
  var nama, harga, deskripsi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lihat Detail Barang"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Nama"),
                  Text(":"),
                  Text("$nama"),
                ],
              ),
              Row(
                children: [
                  Text("Harga"),
                  Text(":"),
                  Text(formatCurrency.format(harga)),
                ],
              ),
              Row(
                children: [
                  Text("Deskripsi"),
                  Text(":"),
                  Text(deskripsi ?? ''),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
