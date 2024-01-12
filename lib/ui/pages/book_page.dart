import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halodoc Pemesanan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController _medicineController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan Halodoc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Obat yang ingin dipesan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _medicineController,
              decoration: InputDecoration(
                hintText: 'Nama obat',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Jumlah:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Jumlah obat',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _placeOrder();
              },
              child: Text('Pesan Obat'),
            ),
          ],
        ),
      ),
    );
  }

  void _placeOrder() {
    String medicine = _medicineController.text;
    String quantity = _quantityController.text;

    if (medicine.isNotEmpty && quantity.isNotEmpty) {
      // Lakukan logika pemesanan, misalnya mengirim ke server atau menambahkan ke database
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Pemesanan Berhasil'),
          content: Text('Obat $medicine sejumlah $quantity berhasil dipesan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Gagal Memesan'),
          content: Text('Pastikan semua kolom diisi dengan benar.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
