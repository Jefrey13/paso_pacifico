import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String name;
  String email;
  String phone;
  DateTime? dateOfBirth;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    this.dateOfBirth,
  });

  // Convierte un mapa a un objeto UserProfile
  factory UserProfile.fromMap(Map<String, dynamic> data) {
    return UserProfile(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      dateOfBirth: (data['dateOfBirth'] as Timestamp).toDate(),
    );
  }

  // Convierte un objeto UserProfile a un mapa
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'dateOfBirth': Timestamp.fromDate(dateOfBirth!),
    };
  }
}
