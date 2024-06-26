import '../models/resource.dart';

class ResourceService {
  static List<Resource> getResources() {
    return [
      // Hotels
      Resource(
        name: 'Hotel A',
        description: 'Vegetarian and non-vegetarian options available.',
        contact: '1234567890',
        location: '123 Main Street, City A',
      ),
      Resource(
        name: 'Hotel B',
        description: 'Specializes in local cuisine.',
        contact: '2345678901',
        location: '456 Oak Avenue, City B',
      ),
      Resource(
        name: 'Hotel C',
        description: 'Fine dining experience with outdoor seating.',
        contact: '3456789012',
        location: '789 Elm Road, City C',
      ),
      // Add more hotels as needed

      // Train Stations
      Resource(
        name: 'City Central Train Station',
        description: 'Major train hub with multiple platforms.',
        contact: '9876543210',
        location: '456 Maple Street, City X',
      ),
      Resource(
        name: 'Suburban Junction Train Station',
        description: 'Connecting trains to suburban areas.',
        contact: '8765432109',
        location: '789 Pine Avenue, City Y',
      ),
      // Add more train stations as needed

      // Bus Stations
      Resource(
        name: 'Downtown Bus Terminal',
        description: 'Central location for city buses.',
        contact: '7654321098',
        location: '234 Cedar Lane, City Z',
      ),
      Resource(
        name: 'Eastside Bus Depot',
        description: 'Serving routes to eastern suburbs.',
        contact: '6543210987',
        location: '901 Oak Street, City W',
      ),
      // Add more bus stations as needed

      // Example additional entries:
      Resource(
        name: 'Hotel D',
        description: 'Family-friendly restaurant with playground.',
        contact: '4567890123',
        location: '901 Pine Lane, City D',
      ),
      Resource(
        name: 'Train Station E',
        description: 'Historic station with modern amenities.',
        contact: '5432109876',
        location: '345 Elm Avenue, City V',
      ),
      Resource(
        name: 'Bus Terminal F',
        description: 'Newly renovated terminal with food court.',
        contact: '4321098765',
        location: '678 Maple Road, City U',
      ),
      // Add more entries as needed up to 50
    ];
  }
}
