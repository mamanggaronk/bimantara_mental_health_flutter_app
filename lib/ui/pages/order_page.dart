import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halodoc Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat dengan Dokter'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
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
                      hintText: 'Ketik pesan...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
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
    String messageText = _messageController.text.trim();

    if (messageText.isNotEmpty) {
      ChatMessage message = ChatMessage(
        text: messageText,
        isDokter: false, // Pesan dari pengguna
      );

      setState(() {
        _messages.add(message);
      });

      // Simulasikan balasan dari dokter
      _simulateDokterReply();

      _messageController.clear();
    }
  }

  void _simulateDokterReply() {
    Future.delayed(Duration(seconds: 2), () {
      ChatMessage reply = ChatMessage(
        text: 'Terima kasih atas pertanyaannya. Bagaimana saya bisa membantu Anda?',
        isDokter: true, // Pesan dari dokter
      );

      setState(() {
        _messages.add(reply);
      });
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isDokter;

  const ChatMessage({
    required this.text,
    required this.isDokter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: isDokter ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDokter ? Colors.grey[300] : Colors.blue,
        ),
        child: Text(
          text,
          style: TextStyle(color: isDokter ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
