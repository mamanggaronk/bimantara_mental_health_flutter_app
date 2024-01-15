import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_string.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UpdateProfil extends StatelessWidget {
  const UpdateProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(FontAwesomeIcons.arrowLeft)),
        title: Text("Edit Profile", style: bold),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: white,
                    backgroundImage: NetworkImage(
                      'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: primaryColor),
                      child: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 17,
                      ),
                      hintText: 'shava123@gmail.com',
                      hintStyle: medium.copyWith(
                        color: black,
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 17,
                      ),
                      hintText: 'Shava',
                      hintStyle: medium.copyWith(
                        color: black,
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 17,
                      ),
                      hintText: '081225727970',
                      hintStyle: medium.copyWith(
                        color: black,
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
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 17,
                      ),
                      hintText: 'shava12345',
                      hintStyle: medium.copyWith(
                        color: black,
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
                  const SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const UpdateProfil()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          tmenu5,
                          style: TextStyle(
                            color: black,
                          ),
                        ),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
