
class service {
  final int service_id;
  final String name;
  final String type;
  final int charges;
  final String chargesDetail;

  service({
    required this.service_id,
    required this.name,
    required this.type,
    required this.charges,
    required this.chargesDetail,
  });

  // Factory method to create User from JSON
  factory service.fromJson(Map<String, dynamic> json) {
    return service(
      service_id: json['service_id'] ?? 0, // Default to 0 if not provided
      name: json['name'] ?? '', // Default to empty string if null
      type: json['type'] ?? '', // Default to empty string if null
      charges: json['charges'] ?? 0, // Default to 0 if null
      chargesDetail: json['chargesDetail'] ?? '', // Default to 'user' if null
    );
  }
}
