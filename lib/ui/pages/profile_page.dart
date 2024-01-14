import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController classController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    nimController.dispose();
    weightController.dispose();
    heightController.dispose();
    majorController.dispose();
    classController.dispose();
  }

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
        padding: const EdgeInsets.all(16),
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
              'Shava ',
              style: bold.copyWith(
                fontSize: 24,
              ),
            ),
            const Gap(
              8,
            ),
            Text(
              'Mahasiswa',
              style: regular.copyWith(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            buildInfoRow('Email', 'satumaniz@gmail.com'),
            buildInfoRow('Nomor Telepon', '081235555'),
            buildInfoRow('Alamat', 'Jl. mana aja uda capek'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hal yang ingin kamu bagikan?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Edit Profil:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Nama',
                      ),
                    ),
                    TextField(
                      controller: nimController,
                      decoration: const InputDecoration(
                        hintText: 'NIM',
                      ),
                    ),
                    TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Berat Badan (kg)',
                      ),
                    ),
                    TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Tinggi Badan (cm)',
                      ),
                    ),
                    TextField(
                      controller: majorController,
                      decoration: const InputDecoration(
                        hintText: 'Jurusan',
                      ),
                    ),
                    TextField(
                      controller: classController,
                      decoration: const InputDecoration(
                        hintText: 'Kelas',
                      ),
                    ),
                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        // _placeOrder();
                      },
                      child: const Text('Pesan'),
                    ),
                  ],
                );
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
