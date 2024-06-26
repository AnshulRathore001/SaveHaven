import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  EmergencyButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Red color for emergency buttons
      ),
      child: Text(label),
    );
  }
}
