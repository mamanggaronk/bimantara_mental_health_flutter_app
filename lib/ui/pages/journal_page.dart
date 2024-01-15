import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/data/controller/mood_controller.dart';
import 'package:get/get.dart';

List<Color> customColors = [
  Colors.tealAccent,
  Colors.lightBlueAccent,
  Colors.orangeAccent,
  // Add more colors as needed
];

class JournalPage extends GetView<MoodController> {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MoodController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Journal",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            color: primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: controller.firestoreService.getNotesStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = notesList[index];
                  String docID = document.id; // Declare docID here
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String noteText = data['note'];

                  // Calculate a different color for each row based on the index
                  Color rowColor = customColors[index % customColors.length];

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: rowColor, // Set the row color
                    child: ListTile(
                      title: Text(
                        noteText,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => controller.openNoteBox(
                              docID: docID,
                              action: "update",
                              defaultNote: noteText,
                            ),
                            icon: const Icon(Icons.edit),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () =>
                                controller.firestoreService.deleteNote(docID),
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.openNoteBox(),
        backgroundColor: primaryColor,
        tooltip: 'Isi Journal',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
