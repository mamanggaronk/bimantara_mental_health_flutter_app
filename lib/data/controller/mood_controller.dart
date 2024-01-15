import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/services/firestore.dart';
import 'package:flutter_application_1/ui/widgets/mood_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MoodController extends GetxController {
  RxMap selectedMood = {}.obs;
  RxString errorMessage = "".obs;

  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();

  Future<void> signOutAccount() async {
    try {
      await Auth().signOut();
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.toString();
    }
  }

  void openNoteBox(
      {String? docID, String action = "add", String? defaultNote}) {
    textController.text = defaultNote ?? "";

    final moodController = Get.find<MoodController>();
    moodController.changeMood({});

    showDialog(
      context: Get.context!,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(
            () {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    action == "add" ? "Isi Journal" : "Update Journal",
                    style: bold.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  moodController.selectedMood.isEmpty
                      ? MoodPicker(
                          onTap: (Map<String, dynamic> value) {
                            moodController.changeMood(value);
                          },
                        )
                      : Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color:
                                moodController.selectedMood['color'] as Color,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              moodController.selectedMood['iconPath'] as String,
                            ),
                          ),
                        ),
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    cursorColor: Colors.blue,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Cancel button action
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (docID == null) {
                        firestoreService.addNote(
                          textController.text,
                          selectedMood['label'] as String,
                        );
                      } else {
                        firestoreService.updateNote(
                          docID,
                          textController.text,
                          selectedMood['label'] as String,
                        );
                      }
                      textController.clear();
                      Navigator.pop(context); // Close the box
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      action == "add" ? "ADD" : "UPDATE",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void changeMood(Map newSelectedMood) {
    selectedMood.value = newSelectedMood;
  }
}
