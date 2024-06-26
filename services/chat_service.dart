// lib/services/chat_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  static List<String> getMessages() {
    return ['Hello! How can I help you today?'];
  }

  static Future<String> sendMessage(String message) async {
    final apiKey = 'N1zxv78OCUCWhDtrLKFSue_uvJq2nDCh'; // Replace with your OpenAI API key
    final url = Uri.parse('https://app.chatbot.com/');
    
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          {'role': 'user', 'content': message},
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final botMessage = data['choices'][0]['message']['content'];
      return botMessage;
    } else {
      throw Exception('Failed to load response from OpenAI');
    }
  }
}
