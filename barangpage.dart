import 'package:flutter/material.dart';

import 'model/barang.dart';

class BarangPage extends StatelessWidget {
  final List<Barang> barangList;

  const BarangPage({super.key, required this.barangList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Barang')),
      body: ListView.builder(
        itemCount: barangList.length,
        itemBuilder: (context, index) {
          final barang = barangList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.inventory, color: Colors.blue.shade700),
              ),
              title: Text(barang.nama),
              subtitle: Text('Stok: ${barang.stok} | Harga: Rp${barang.harga}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(barang.nama),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${barang.id}'),
                        Text('Stok: ${barang.stok}'),
                        Text('Harga: Rp${barang.harga}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
