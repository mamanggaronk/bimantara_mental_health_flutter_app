import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TalkPlace extends StatelessWidget {
  const TalkPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 170,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 35,
            child: SvgPicture.asset(
              'assets/images/talk_place.svg',
            ),
          ),
          Positioned(
            bottom: 10,
            right: 15,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/book');
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: primaryColor,
              ),
              child: Text(
                'Bantu Saya',
                style: semiBold,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 25,
            child: Text(
              "Tidak yakin harus konsultasi ke\nsiapa?",
              style: regular.copyWith(
                fontSize: 18,
                color: white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
