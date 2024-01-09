import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // * Memberikan jeda sekitar 3 detik sebelum berganti halaman
    const durasi = Duration(seconds: 3);
    Future.delayed(durasi, () {
      // * Get.offNamed() digunakan untuk berpindah halaman tanpa kembali ke halaman sebelumnya
      // * Navigator.pushReplacementNamed() digunakan untuk berpindah halaman tanpa kembali ke halaman sebelumnya
      Get.offNamed('/login');
    });

    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/app_logo.svg',
        ),
      ),
    );
  }
}
