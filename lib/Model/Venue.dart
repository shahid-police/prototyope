class Venue {
  final int venue_id;
  final String name;
  final String location;

  final String capacity;
  final String availability;


  Venue({
    required this.venue_id,
    required this.name,
    required this.location,

    required this.capacity,
    required this.availability,

  });

  // Factory method to create User from JSON
  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      venue_id: json['venue_id'] ?? 0, // Default to 0 if not provided
      name: json['name'] ?? '', // Default to empty string if null
      location: json['location'] ?? '', // Default to empty string if null
      capacity: json['capacity'] ?? '', // Default to empty string if null

      availability: json['availability'] ?? '', // Default to empty string if null

    );
  }
}