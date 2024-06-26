import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyScreen extends StatefulWidget {
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  String? _emergencyContact;
  bool _showContactList = false;

  List<Map<String, String>> emergencyNumbers = [
    {'name': 'Police', 'number': '911'},
    {'name': 'Fire Department', 'number': '101'},
    {'name': 'Ambulance', 'number': '102'},
    // Add more predefined emergency numbers as needed
  ];

  @override
  void initState() {
    super.initState();
    _loadEmergencyContact();
  }

  Future<void> _loadEmergencyContact() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _emergencyContact = prefs.getString('emergencyContact');
      if (_emergencyContact != null) {
        emergencyNumbers.add({'name': 'User Contact', 'number': _emergencyContact!});
      }
    });
  }

  Future<void> _saveEmergencyContact() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('emergencyContact', _numberController.text);
    setState(() {
      _emergencyContact = _numberController.text;
      emergencyNumbers.add({'name': _nameController.text, 'number': _numberController.text});
    });
    _nameController.clear();
    _numberController.clear();
  }

  void _callEmergencyServices(String number) async {
    final emergencyNumber = 'tel:$number';
    if (await canLaunch(emergencyNumber)) {
      await launch(emergencyNumber);
    } else {
      throw 'Could not launch $emergencyNumber';
    }
  }

  void _messageEmergencyContact(String number) async {
    final smsUrl = 'sms:$number';
    if (await canLaunch(smsUrl)) {
      await launch(smsUrl);
    } else {
      throw 'Could not launch $smsUrl';
    }
  }

  void _toggleContactList() {
    setState(() {
      _showContactList = !_showContactList;
    });
  }

  void _deleteContact(int index) {
    setState(() {
      emergencyNumbers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Assistance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _callEmergencyServices('911'), // Default emergency number
              child: Text(
                'Call Emergency Services',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  backgroundColor: Color.fromARGB(255, 231, 90, 44),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_emergencyContact != null) {
                  _messageEmergencyContact(_emergencyContact!);
                }
              },
              child: Text(
                'Message Emergency Contact',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  backgroundColor: Color.fromARGB(255, 243, 113, 77),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter Contact Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _numberController,
                    decoration: InputDecoration(
                      labelText: 'Enter Emergency Contact Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _saveEmergencyContact,
                    child: Text(
                      'Add Emergency Contact',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        backgroundColor: Color.fromARGB(255, 131, 175, 155),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleContactList,
              child: Text(
                _showContactList ? 'Hide Contact List' : 'Show Contact List',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  backgroundColor: Color.fromARGB(255, 150, 150, 150),
                ),
              ),
            ),
            _showContactList
                ? Expanded(
                    child: ListView.builder(
                      itemCount: emergencyNumbers.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text(emergencyNumbers[index]['name']!),
                          subtitle: Text(emergencyNumbers[index]['number']!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.call),
                                onPressed: () => _callEmergencyServices(emergencyNumbers[index]['number']!),
                              ),
                              IconButton(
                                icon: Icon(Icons.message),
                                onPressed: () => _messageEmergencyContact(emergencyNumbers[index]['number']!),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _deleteContact(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
