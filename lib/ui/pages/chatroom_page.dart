import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _messageController = TextEditingController();
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Room',
          style: bold,
        ),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _messagesCollection
                  .orderBy(
                    'timestamp',
                    descending: true,
                  )
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  List<DocumentSnapshot> messages = snapshot.data!.docs;
                  List<Map<String, dynamic>> formattedMessages = [];

                  for (DocumentSnapshot message in messages) {
                    Timestamp timestamp = message['timestamp'] as Timestamp;
                    String formattedTime =
                        DateFormat('HH:mm').format(timestamp.toDate());

                    Map<String, dynamic> formattedData = {
                      'sender_id': message['sender_id'],
                      'text': message['text'],
                      'timestamp': formattedTime,
                    };

                    formattedMessages.add(formattedData);
                  }

                  if (formattedMessages.isEmpty) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        var message =
                            messages[index].data() as Map<String, dynamic>;
                        return Row(
                          mainAxisAlignment: message['sender_id'] ==
                                  FirebaseAuth.instance.currentUser!.uid
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message['text'],
                                    style: regular,
                                  ),
                                  Text(
                                    DateFormat('HH:mm').format(
                                      (message['timestamp'] as Timestamp)
                                          .toDate(),
                                    ),
                                    style: regular.copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketikkan pesan...',
                      hintStyle: regular,
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const Gap(
                  10,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    foregroundColor: MaterialStateProperty.all(white),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(15),
                    ),
                  ),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String text = _messageController.text.trim();
    if (text.isNotEmpty) {
      _messagesCollection.add({
        'sender_id': FirebaseAuth.instance.currentUser!.uid,
        'text': text,
        'timestamp': DateTime.now(),
      });

      _messageController.clear();
    }
  }
}
