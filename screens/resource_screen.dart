import 'package:flutter/material.dart';
import '../models/resource.dart'; // Adjust the path based on your project structure
import '../services/resource_service.dart'; // Adjust the path based on your project structure
import '../widgets/resource_card.dart'; // If you have a ResourceCard widget

class ResourceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Resource> resources = ResourceService.getResources(); // Fetch resources from a service

    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return ResourceCard(resource: resources[index]); // Assuming you have a ResourceCard widget
        },
      ),
    );
  }
}
