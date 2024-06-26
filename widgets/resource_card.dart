// lib/widgets/resource_card.dart

import 'package:flutter/material.dart';
import '../models/resource.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;

  ResourceCard({required this.resource});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(resource.name),
        subtitle: Text(resource.description),
        trailing: IconButton(
          icon: Icon(Icons.phone),
          onPressed: () {
            _launchCaller(resource.contact);
          },
        ),
      ),
    );
  }

  void _launchCaller(String contact) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: contact,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $contact';
    }
  }
}
