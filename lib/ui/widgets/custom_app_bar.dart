import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    String namaUser = "Shava";
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/as.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            40,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Gap(
            40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.rotationY(math.pi),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(
                    'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
          const Gap(
            17,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Datang,",
                style: medium.copyWith(
                  fontSize: 26,
                ),
              ),
              Text(
                namaUser,
                style: bold.copyWith(
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
