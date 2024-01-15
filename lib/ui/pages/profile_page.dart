import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_string.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:flutter_application_1/ui/pages/update_profil.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Saya',
          style: bold,
        ),
        backgroundColor: primaryColor,
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
              'Shava',
              style: bold.copyWith(
                fontSize: 24,
              ),
            ),
            const Gap(
              8,
            ),
            Text(
              'shava123@gmail.com',
              style: medium.copyWith(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const Gap(
              8,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to UpdateProfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateProfil()),
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
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                ),
                child: const Icon(
                  FontAwesomeIcons.calendar,
                  size: 18.0,
                ),
              ),
              title: Text(
                tmenu1,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: white,
                ),
                child: const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 18.0,
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                ),
                child: const Icon(
                  FontAwesomeIcons.info,
                  size: 18.0,
                ),
              ),
              title: Text(
                tmenu3,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: white,
                ),
                child: const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 18.0,
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                ),
                child: const Icon(
                  FontAwesomeIcons.doorOpen,
                  size: 18.0,
                ),
              ),
              title: Text(
                tmenu4,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.red, // Set the color to red
                    ),
              ),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: white,
                ),
                child: const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 18.0,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                _handleLogOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () async {
                // Perform log-out actions here
                // For example, clear user authentication status, navigate to login screen, etc.
                // Navigate to the login screen
                await FirebaseAuth.instance.signOut();
                Get.offAndToNamed('/login');
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
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
