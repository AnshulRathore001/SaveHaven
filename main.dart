import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/resource_screen.dart';
import 'screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHaven',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/emergency': (context) => EmergencyScreen(),
        '/resources': (context) => ResourceScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
    
  }
}
