import 'package:flutter/material.dart';

class SafetyPlanScreen extends StatefulWidget {
  @override
  _SafetyPlanScreenState createState() => _SafetyPlanScreenState();
}

class _SafetyPlanScreenState extends State<SafetyPlanScreen> {
  final List<String> safetySteps = [
    'Keep your phone charged and with you at all times.',
    'Know the exits in your home.',
    'Inform trusted neighbors about your situation.',
    'Have a list of emergency contacts.',
    'Keep important documents in an accessible place.',
    'Plan a safe meeting place with family members.',
    'Create a code word with friends and family for emergencies.',
    'Keep some cash on hand for emergencies.',
    'Ensure your home is well-lit at night.',
    'Avoid posting your location on social media.',
  ];
  final TextEditingController _controller = TextEditingController();

  void _addSafetyStep() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        safetySteps.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeSafetyStep(int index) {
    setState(() {
      safetySteps.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: safetySteps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${index + 1}. ${safetySteps[index]}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _removeSafetyStep(index);
                      },
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add a new safety step',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addSafetyStep,
              child: Text('Add Step'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SafetyPlanScreen(),
  ));
}
