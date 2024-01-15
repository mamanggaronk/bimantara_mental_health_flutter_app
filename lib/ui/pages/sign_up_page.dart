import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 27,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Gap(
                115,
              ),
              Text(
                'Selamat Datang\ndi Bimantara',
                style: medium.copyWith(
                  fontSize: 24,
                ),
              ),
              const Gap(
                35,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 17,
                  ),
                  hintText: 'E-mail',
                  hintStyle: medium.copyWith(
                    color: grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: grey,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const Gap(
                27,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 17,
                  ),
                  hintText: 'Password',
                  hintStyle: medium.copyWith(
                    color: grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: grey,
                      width: 1.5,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: grey,
                    ),
                  ),
                ),
              ),
              const Gap(
                27,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 17,
                  ),
                  hintText: 'Full Name',
                  hintStyle: medium.copyWith(
                    color: grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: grey,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const Gap(
                27,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 17,
                  ),
                  hintText: 'Phone Number',
                  hintStyle: medium.copyWith(
                    color: grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: grey,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const Gap(
                30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: white,
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(12),
                    elevation: 0,
                    splashFactory: InkRipple.splashFactory,
                  ),
                  child: Text(
                    "Sign Up Now",
                    style: bold,
                  ),
                ),
              ),
              const Gap(
                33,
              ),
              const Divider(
                indent: 120,
                endIndent: 120,
                thickness: 2,
              ),
              const Gap(
                33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sudah punya akun? ',
                    style: regular,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'Login now',
                      style: semiBold.copyWith(
                        color: black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
