// class User {
//   final int userId;
//   final String name;
//   final String email;
//   final String phone;
//   final String role;
//
//   User({
//     required this.userId,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.role,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       userId: json['user_id'] ?? '', // Default to 0 if parsing fails
//       name: json['name'] ?? '', // Default to empty string if null
//       email: json['email'] ?? '', // Default to empty string if null
//       phone: json['phone'] ?? '', // Default to empty string if null
//       role: json['role'] ?? 'user', // Default to 'user' if null
//     );
//   }
// }
class User {
  final int userId;
  final String name;
  final String email;
  final String phone;
  final String role;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  // Factory method to create User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] ?? 0, // Default to 0 if not provided
      name: json['name'] ?? '', // Default to empty string if null
      email: json['email'] ?? '', // Default to empty string if null
      phone: json['phone'] ?? '', // Default to empty string if null
      role: json['role'] ?? 'user', // Default to 'user' if null
    );
  }
}
