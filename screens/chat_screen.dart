// lib/screens/chat_screen.dart

import 'package:flutter/material.dart';
import '../services/chat_service.dart';
import '../widgets/chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = ChatService.getMessages()
      .map((message) => {'sender': 'bot', 'message': message})
      .toList();

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'user', 'message': _controller.text});
      });
      String userMessage = _controller.text;
      _controller.clear();

      try {
        // Get bot response
        String botResponse = await ChatService.sendMessage(userMessage);
        setState(() {
          _messages.add({'sender': 'bot', 'message': botResponse});
        });
      } catch (e) {
        setState(() {
          _messages.add({'sender': 'bot', 'message': 'Error: Unable to get response'});
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatMessage(
                  message: _messages[index]['message']!,
                  sender: _messages[index]['sender']!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
