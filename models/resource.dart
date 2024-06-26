// lib/models/resource.dart

class Resource {
  final String name;
  final String description;
  final String contact;
  final String location;
  

  Resource({
    required this.name,
    required this.description,
    required this.contact,
    required this.location,
  });
    // Factory method to convert map to Resource object
  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      name: map['name'],
      description: map['description'],
      contact: map['contact'],
      location: map['location'],
    );
  }

  // Method to convert Resource object to map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'contact': contact,
      'location': location,
    };
  }

}

