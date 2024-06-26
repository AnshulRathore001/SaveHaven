// lib/widgets/chat_message.dart

import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String sender;

  ChatMessage({required this.message, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sender == 'user' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: sender == 'user' ? Colors.blueAccent : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
