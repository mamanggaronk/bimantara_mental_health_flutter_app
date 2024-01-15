import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:flutter_application_1/data/controller/auth_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 27,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Gap(
                  185,
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
                  controller: authController.emailController,
                  style: medium,
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
                  controller: authController.passwordController,
                  style: medium,
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
                  30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => authController.login(
                      authController.emailController.text,
                      authController.passwordController.text,
                    ),
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
                      "Login Now",
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
                      'Belum punya akun? ',
                      style: regular,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/sign-up'),
                      child: Text(
                        'Sign up now',
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
      ),
    );
  }
}
