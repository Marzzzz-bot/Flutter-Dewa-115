import 'package:flutter/material.dart';

import 'model/transaksi.dart';

class TransaksiPage extends StatelessWidget {
  final List<Transaksi> transaksiList;

  const TransaksiPage({super.key, required this.transaksiList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Transaksi')),
      body: ListView.builder(
        itemCount: transaksiList.length,
        itemBuilder: (context, index) {
          final transaksi = transaksiList[index];
          return Card(
            child: ListTile(
              title: Text('${transaksi.jenis} - ${transaksi.barangId}'),
              subtitle: Text(
                'Jumlah: ${transaksi.jumlah} | Tanggal: ${transaksi.tanggal.toLocal()}',
              ),
              leading: Text(transaksi.id),
            ),
          );
        },
      ),
    );
  }
}
