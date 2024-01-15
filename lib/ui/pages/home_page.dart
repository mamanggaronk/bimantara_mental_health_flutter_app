import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:flutter_application_1/ui/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/ui/widgets/quote_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../widgets/mood_picker.dart';
import '../widgets/talk_place.dart';

List<String> imgs = [
  "doctor1.jpg",
  "doctor2.jpg",
  "doctor3.jpg",
  "doctor4.jpg",
  // Add more image paths or names as needed
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomAppBar(),
              Gap(17),
              MoodPicker(
                onTap: (Map<String, dynamic> value) {
                  print(value);
                },
              ),
              Gap(17),
              TalkPlace(),
              QuoteText(),
              Gap(17),
              // Add the section for "Populer Dokter"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Populer Dokter',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(17),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100, // Increase the width
                                    height: 100, // Increase the height
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/profil/${imgs[index]}",
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Dr. Doctor Name",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    "Therapist",
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 4,
                        right: 0,
                        child: Image.asset(
                          'assets/images/jorual.png', // Replace with your actual image path
                          height: 220,
                          width: 490,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 15,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/journal');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            'Buat Journal',
                            style: semiBold.copyWith(color: black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 17,
                        left: 25,
                        child: Text(
                          "Catatlah your diary in Journal\nBikin sekarang juga.",
                          style: bold.copyWith(
                            fontSize: 16,
                            color: black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Gap(17),
            ],
          ),
        ),
      ),
    );
  }
}
