import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:flutter_application_1/data/controller/auth_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  void _signUp() async {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      String fullname = fullnameController.text;
      String phonenumber = phonenumberController.text;

      await authController.signUp(email, password, fullname, phonenumber);

      Get.toNamed('/login');
    } catch (e) {
      print("Error during sign-up: $e");
    }
  }

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
        child: SingleChildScrollView(
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
                controller: emailController,
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
                controller: passwordController,
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
                controller: fullnameController,
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
                controller: phonenumberController,
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
                  onPressed: _signUp,
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
    ));
  }
}
