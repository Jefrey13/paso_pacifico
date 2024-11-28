import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String displayName;
  String email;
  String phoneNumber;

  UserProfile({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
  });

  // Convierte un mapa a un objeto UserProfile
  factory UserProfile.fromMap(Map<String, dynamic> data) {
    return UserProfile(
      displayName: data['displayName'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }

  // Convierte un objeto UserProfile a un mapa
  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
