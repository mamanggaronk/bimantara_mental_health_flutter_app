import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bimantara Beranda'),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('BIMANTARA'),
              subtitle: Text('Deskripsi konten BIMANTARA'),
              onTap: () {
                // Navigasi ke halaman detail atau tindakan lainnya
              },
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('BIMANTARA'),
              subtitle: Text('Deskripsi konten Bimantara'),
              onTap: () {
                // Navigasi ke halaman detail atau tindakan lainnya
              },
            ),
          ),
          // Tambahkan lebih banyak Card untuk konten lainnya
        ],
      ),
    );
  }
}