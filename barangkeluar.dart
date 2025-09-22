import 'package:flutter/material.dart';

import 'model/barang.dart';
import 'model/transaksi.dart';

class BarangKeluarPage extends StatefulWidget {
  final List<Barang> barangList;
  final List<Transaksi> transaksiList;
  final Function(Barang, int) onBarangKeluar;

  const BarangKeluarPage({
    super.key,
    required this.barangList,
    required this.transaksiList,
    required this.onBarangKeluar,
  });

  @override
  State<BarangKeluarPage> createState() => _BarangKeluarPageState();
}

class _BarangKeluarPageState extends State<BarangKeluarPage> {
  Barang? selectedBarang;
  final TextEditingController jumlahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barang Keluar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<Barang>(
              hint: const Text('Pilih Barang'),
              value: selectedBarang,
              isExpanded: true,
              items: widget.barangList.map((b) {
                return DropdownMenuItem(value: b, child: Text(b.nama));
              }).toList(),
              onChanged: (b) => setState(() => selectedBarang = b),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: jumlahController,
              decoration: const InputDecoration(
                labelText: 'Jumlah Keluar',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (selectedBarang != null &&
                    jumlahController.text.isNotEmpty) {
                  int jumlah = int.tryParse(jumlahController.text) ?? 0;
                  if (jumlah > 0 && selectedBarang!.stok >= jumlah) {
                    widget.onBarangKeluar(selectedBarang!, jumlah);
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Kurangi Barang Keluar'),
            ),
          ],
        ),
      ),
    );
  }
}
