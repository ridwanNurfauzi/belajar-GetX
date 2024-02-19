import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/biodata_controller.dart';

// class BiodataView extends GetView<BiodataController> {
class BiodataView extends StatelessWidget {
  BiodataView({Key? key}) : super(key: key);

  final BiodataController biodataController = BiodataController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BiodataView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nama'),
                      onChanged: (value) =>
                          biodataController.nama.value = value,
                    ),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () => biodataController.selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Tanggal Lahir",
                          hintText: 'Pilih tanggal',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tanggal Lahir'),
                            Obx(() =>
                                Text(biodataController.selectedDate.value))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField(
                      items: [
                        'Islam',
                        'Kristen',
                        'Hindu',
                        'Budha',
                        'Khong guan',
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          biodataController.agama.value = value.toString(),
                      decoration: InputDecoration(labelText: 'Agama'),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "Laki-laki",
                            groupValue: biodataController.jenisKelamin.value,
                            onChanged: (value) =>
                                biodataController.jenisKelamin.value = value!,
                          ),
                        ),
                        Text("Laki-laki"),
                        Obx(
                          () => Radio(
                            value: "Perempuan",
                            groupValue: biodataController.jenisKelamin.value,
                            onChanged: (value) =>
                                biodataController.jenisKelamin.value = value!,
                          ),
                        ),
                        Text("Perempuan"),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Alamat'),
                      onChanged: (value) =>
                          biodataController.alamat.value = value,
                    ),
                    SizedBox(height: 16),
                    for (String hobi in biodataController.getHobiList())
                      Obx(
                        () => CheckboxListTile(
                          title: Text(hobi),
                          value: biodataController.hobi.contains(hobi),
                          onChanged: (value) =>
                              biodataController.tonggleHobi(hobi),
                        ),
                      ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => biodataController.submitForm(),
                      child: Text('Kirim'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (biodataController.isFormSubmitted.value) {
                  return Text(
                    "Output: ${biodataController.nama}, ${biodataController.tanggalLahir}, ${biodataController.agama}, ${biodataController.jenisKelamin}, ${biodataController.alamat}, ${biodataController.hobi}",
                    style: TextStyle(fontSize: 16),
                  );
                } else {
                  return SizedBox.shrink();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
