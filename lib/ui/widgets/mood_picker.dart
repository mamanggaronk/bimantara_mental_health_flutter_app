import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../common/text_styles.dart';

const moodList = [
  {
    'color': pink,
    'iconPath': 'assets/icons/happy.svg',
    'label': 'Senang',
  },
  {
    'color': purple,
    'iconPath': 'assets/icons/calm.svg',
    'label': 'Tenang',
  },
  {
    'color': cyan,
    'iconPath': 'assets/icons/stress.svg',
    'label': 'Stress',
  },
  {
    'color': orange,
    'iconPath': 'assets/icons/angry.svg',
    'label': 'Marah',
  },
  {
    'color': lime,
    'iconPath': 'assets/icons/angry.svg',
    'label': 'Sedih',
  },
];

class MoodPicker extends StatefulWidget {
  final Function(Map<String, dynamic>) onTap;

  const MoodPicker({
    super.key,
    required this.onTap,
  });

  @override
  State<MoodPicker> createState() => _MoodPickerState();
}

class _MoodPickerState extends State<MoodPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bagaimana perasaan Anda hari ini?',
            style: medium.copyWith(
              fontSize: 16,
            ),
          ),
          const Gap(20),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moodList.length,
              itemBuilder: (context, index) {
                final mood = moodList[index];
                return GestureDetector(
                  onTap: () {
                    // _showMoodDialog(context, mood['label'] as String);
                    setState(() {
                      widget.onTap(moodList[index]);
                    });
                    // print(mood['label'] as String);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: mood['color'] as Color,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              mood['iconPath'] as String,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Text(
                          mood['label'] as String,
                          style: medium.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showMoodDialog(BuildContext context, String moodLabel) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terima Kasih sudah check in 🙏'),
          content: Text(
            'Mood anda hari ini $moodLabel',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
