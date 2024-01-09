import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halodoc Profil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Ganti dengan path gambar profil
            ),
            SizedBox(height: 16),
            Text(
              'Nama Pengguna',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Spesialis Dokter Umum',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            buildInfoRow('Email', 'pengguna@example.com'),
            buildInfoRow('Nomor Telepon', '0812-3456-7890'),
            buildInfoRow('Alamat', 'Jl. Contoh No. 123, Kota Contoh'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle tombol edit profil
              },
              child: Text('Edit Profil'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle tombol keluar
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Keluar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halodoc Profil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Ganti dengan path gambar profil
            ),
            SizedBox(height: 16),
            Text(
              'Nama Pengguna',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Spesialis Dokter Umum',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            buildInfoRow('Email', 'pengguna@example.com'),
            buildInfoRow('Nomor Telepon', '0812-3456-7890'),
            buildInfoRow('Alamat', 'Jl. Contoh No. 123, Kota Contoh'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle tombol edit profil
              },
              child: Text('Edit Profil'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle tombol keluar
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Keluar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
