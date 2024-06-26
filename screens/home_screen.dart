import 'package:flutter/material.dart';
import 'emergency_screen.dart';
import 'resource_screen.dart';
import 'chat_screen.dart';
import 'safety_plan_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SafeHaven'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildMenuItem(
                context,
                icon: Icons.warning,
                label: 'Emergency Assistance',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyScreen()));
                },
              ),
              SizedBox(height: 20.0),
              buildMenuItem(
                context,
                icon: Icons.local_hotel,
                label: 'Shelters & Resources',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResourceScreen()));
                },
              ),
              SizedBox(height: 20.0),
              buildMenuItem(
                context,
                icon: Icons.message,
                label: 'Secure Chat',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                },
              ),
              SizedBox(height: 20.0),
              buildMenuItem(
                context,
                icon: Icons.assignment,
                label: 'Safety Plan',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SafetyPlanScreen()));
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Login'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 30.0),
            SizedBox(width: 20.0),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
