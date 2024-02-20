import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InvoiceController extends GetxController {
  var fullname = ''.obs;
  var placeOfBirth = ''.obs;
  var dateOfBirth = ''.obs;
  var gender = 'Laki-laki'.obs;
  var email = ''.obs;
  var nationality = ''.obs;

  var typeOfMember = ''.obs;

  var cardNumber = ''.obs;
  var expiredDate = ''.obs;
  var payment = ''.obs;

  var benefits = ''.obs;

  var typeOfMembershipList = [
    {
      "name": "Regular",
      "price": 50000,
      "benefits": "Anggota 1 Bulan",
    },
    {
      "name": "Gold",
      "price": 150000,
      "benefits": "Anggota 1 Bulan + cemilan gratis",
    },
    {
      "name": "Platinum",
      "price": 250000,
      "benefits": "Anggota 2 Bulan + cemilan gratis + Free Wi-Fi",
    },
    {
      "name": "VIP",
      "price": 500000,
      "benefits": "Anggota 3 Bulan + cemilan gratis + Free Wi-Fi + tiket konser",
    },
  ];

  Future<void> selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dateOfBirth.value = formattedDate;
    }
  }

  Future<void> selectExpireDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      expiredDate.value = formattedDate;
    }
  }
}
