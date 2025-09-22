class Barang {
  final String id;
  final String nama;
  int stok;
  final double harga;

  Barang({
    required this.id,
    required this.nama,
    required this.stok,
    required this.harga,
  });

  // Dari JSON ke Barang
  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'],
      nama: json['nama'],
      stok: json['stok'],
      harga: (json['harga'] as num).toDouble(),
    );
  }

  // Dari Barang ke JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'nama': nama, 'stok': stok, 'harga': harga};
  }
}
