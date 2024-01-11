import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Saya',
          style: medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: white,
              backgroundImage: NetworkImage(
                'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
              ),
            ),
            const Gap(
              16,
            ),
            Text(
              'Nama Pengguna',
              style: bold.copyWith(
                fontSize: 24,
              ),
            ),
            const Gap(
              8,
            ),
            Text(
              'Spesialis Dokter Umum',
              style: regular.copyWith(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            buildInfoRow('Email', 'pengguna@example.com'),
            buildInfoRow('Nomor Telepon', '0812-3456-7890'),
            buildInfoRow('Alamat', 'Jl. Contoh No. 123, Kota Contoh'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // ! TODO: Tambahkan fungsi untuk edit profil
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: white,
                backgroundColor: primaryColor,
              ),
              child: Text(
                'Edit Profil',
                style: bold,
              ),
            ),
            const Gap(
              10,
            ),
            ElevatedButton(
              onPressed: () {
                // ! TODO: Tambahkan fungsi untuk logout
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: white,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Keluar',
                style: bold,
              ),
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
            style: medium.copyWith(
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: semiBold.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
