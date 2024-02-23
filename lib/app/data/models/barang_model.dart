class Barang {
  int id;
  String nama;
  double harga;
  String? deskripsi;

  bool isEditable;

  Barang({
    required this.id,
    required this.nama,
    required this.harga,
    this.deskripsi,
    this.isEditable = false,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'],
      nama: json['nama'],
      harga: double.parse(json['harga'].toString()),
      deskripsi: json['deskripsi'],
    );
  }
}
