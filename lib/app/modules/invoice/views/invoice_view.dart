import 'package:belajar_getx1/app/modules/invoice/views/invoice_output.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/invoice_controller.dart';

const countries = [
  "Afghanistan",
  "Albania",
  "Algeria",
  "Andorra",
  "Angola",
  "Anguilla",
  "Antigua & Barbuda",
  "Argentina",
  "Armenia",
  "Aruba",
  "Australia",
  "Austria",
  "Azerbaijan",
  "Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barbados",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bermuda",
  "Bhutan",
  "Bolivia",
  "Bosnia & Herzegovina",
  "Botswana",
  "Brazil",
  "British Virgin Islands",
  "Brunei",
  "Bulgaria",
  "Burkina Faso",
  "Burundi",
  "Cambodia",
  "Cameroon",
  "Cape Verde",
  "Cayman Islands",
  "Chad",
  "Chile",
  "China",
  "Colombia",
  "Congo",
  "Cook Islands",
  "Costa Rica",
  "Cote D Ivoire",
  "Croatia",
  "Cruise Ship",
  "Cuba",
  "Cyprus",
  "Czech Republic",
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Equatorial Guinea",
  "Estonia",
  "Ethiopia",
  "Falkland Islands",
  "Faroe Islands",
  "Fiji",
  "Finland",
  "France",
  "French Polynesia",
  "French West Indies",
  "Gabon",
  "Gambia",
  "Georgia",
  "Germany",
  "Ghana",
  "Gibraltar",
  "Greece",
  "Greenland",
  "Grenada",
  "Guam",
  "Guatemala",
  "Guernsey",
  "Guinea",
  "Guinea Bissau",
  "Guyana",
  "Haiti",
  "Honduras",
  "Hong Kong",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Ireland",
  "Isle of Man",
  "Italy",
  "Jamaica",
  "Japan",
  "Jersey",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kuwait",
  "Kyrgyz Republic",
  "Laos",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libya",
  "Liechtenstein",
  "Lithuania",
  "Luxembourg",
  "Macau",
  "Macedonia",
  "Madagascar",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Mauritania",
  "Mauritius",
  "Mexico",
  "Moldova",
  "Monaco",
  "Mongolia",
  "Montenegro",
  "Montserrat",
  "Morocco",
  "Mozambique",
  "Namibia",
  "Nepal",
  "Netherlands",
  "Netherlands Antilles",
  "New Caledonia",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "Norway",
  "Oman",
  "Pakistan",
  "Palestine",
  "Panama",
  "Papua New Guinea",
  "Paraguay",
  "Peru",
  "Philippines",
  "Poland",
  "Portugal",
  "Puerto Rico",
  "Qatar",
  "Reunion",
  "Romania",
  "Russia",
  "Rwanda",
  "Saint Pierre & Miquelon",
  "Samoa",
  "San Marino",
  "Satellite",
  "Saudi Arabia",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Singapore",
  "Slovakia",
  "Slovenia",
  "South Africa",
  "South Korea",
  "Spain",
  "Sri Lanka",
  "St Kitts & Nevis",
  "St Lucia",
  "St Vincent",
  "St. Lucia",
  "Sudan",
  "Suriname",
  "Swaziland",
  "Sweden",
  "Switzerland",
  "Syria",
  "Taiwan",
  "Tajikistan",
  "Tanzania",
  "Thailand",
  "Timor L'Este",
  "Togo",
  "Tonga",
  "Trinidad & Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Turks & Caicos",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "Uruguay",
  "Uzbekistan",
  "Venezuela",
  "Vietnam",
  "Virgin Islands (US)",
  "Yemen",
  "Zambia",
  "Zimbabwe"
];

// class InvoiceView extends GetView<InvoiceController> {
class InvoiceView extends StatelessWidget {
  InvoiceView({Key? key}) : super(key: key);

  final invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nama Lengkap'),
                        onChanged: (value) =>
                            invoiceController.fullname.value = value,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Tempat Lahir'),
                        onChanged: (value) =>
                            invoiceController.placeOfBirth.value = value,
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () =>
                            invoiceController.selectDateOfBirth(context),
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
                                  Text(invoiceController.dateOfBirth.value))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        child: Text("Jenis Kelamin"),
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Radio(
                              value: "Laki-laki",
                              groupValue: invoiceController.gender.value,
                              onChanged: (value) =>
                                  invoiceController.gender.value = value!,
                            ),
                          ),
                          Text("Laki-laki"),
                          Obx(
                            () => Radio(
                              value: "Perempuan",
                              groupValue: invoiceController.gender.value,
                              onChanged: (value) =>
                                  invoiceController.gender.value = value!,
                            ),
                          ),
                          Text("Perempuan"),
                        ],
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'E-Mail'),
                        onChanged: (value) =>
                            invoiceController.email.value = value,
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField(
                        items: countries
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) => invoiceController
                            .nationality.value = value.toString(),
                        decoration: InputDecoration(labelText: 'Kenegaraan'),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField(
                        items: invoiceController.typeOfMembershipList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text('${e['name']}'),
                                ))
                            .toList(),
                        onChanged: (value) {
                          invoiceController.benefits.value =
                              value!['benefits'].toString();
                          invoiceController.payment.value =
                              value['price'].toString();
                          invoiceController.typeOfMember.value =
                              value['name'].toString();
                        },
                        decoration:
                            InputDecoration(labelText: 'Jenis Keanggotaan'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nomor Kartu'),
                        onChanged: (value) =>
                            invoiceController.cardNumber.value = value,
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () =>
                            invoiceController.selectExpireDate(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Tanggal Kadaluarsa",
                            hintText: 'Pilih tanggal',
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tanggal Kadaluarsa'),
                              Obx(() =>
                                  Text(invoiceController.expiredDate.value))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Obx(() => Container(
                          width: double.infinity,
                          child:
                              Text("Payment : ${invoiceController.payment}"))),
                      Obx(() => Container(
                          width: double.infinity,
                          child:
                              Text("Benefit : ${invoiceController.benefits}"))),
                      ElevatedButton(
                        onPressed: () => Get.to(InvoiceOutput()),
                        child: Text('Kirim'),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
                // Obx(() => Text(
                //       "Output: ${invoiceController.fullname}, ${invoiceController.placeOfBirth}, ${invoiceController.dateOfBirth}, ${invoiceController.gender}, ${invoiceController.email}, ${invoiceController.nationality}, ${invoiceController.typeOfMember}, ${invoiceController.cardNumber}, ${invoiceController.payment}, ${invoiceController.benefits}",
                //       style: TextStyle(fontSize: 16),
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
