import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/services/firestore.dart';

List<Color> customColors = [
  Colors.tealAccent,
  Colors.lightBlueAccent,
  Colors.orangeAccent,
  // Add more colors as needed
];

class JournalPage extends StatefulWidget {
  const JournalPage({Key? key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  String? errorMessage = "";
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();

  Future<void> signOutAccount() async {
    try {
      await Auth().signOut();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  void openNoteBox(
      {String? docID, String action = "add", String? defaultNote}) {
    textController.text = defaultNote ?? "";
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        title: Text(action == "add" ? "Isi Journal" : "Update Journal"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          cursorColor: Colors.blue,
        ),
        actions: [
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
                firestoreService.addNote(textController.text);
              } else {
                firestoreService.updateNote(docID, textController.text);
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Journal",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Container(
            color: primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNotesStream(),
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
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => openNoteBox(
                              docID: docID,
                              action: "update",
                              defaultNote: noteText,
                            ),
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () => firestoreService.deleteNote(docID),
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(),
        backgroundColor: primaryColor,
        tooltip: 'Isi Journal',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
