import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/custom_app_bar.dart';
import 'package:gap/gap.dart';

import '../widgets/mood_picker.dart';
import '../widgets/talk_place.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(),
          const Gap(17),
          MoodPicker(),
          const Gap(17),
          TalkPlace(),
        ],
      ),
    );
  }
}