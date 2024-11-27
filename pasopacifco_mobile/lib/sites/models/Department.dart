import 'package:cloud_firestore/cloud_firestore.dart';

class Department {
  final String id;
  final String name;
  final String country;
  final bool hasSeaAccess;
  final bool state;
  final DateTime? createdAt;

  Department({
    required this.id,
    required this.name,
    required this.country,
    required this.hasSeaAccess,
    required this.state,
    this.createdAt,
  });

  /// Crea una instancia de `Department` desde Firestore
  factory Department.fromFirestore(Map<String, dynamic> data, String id) {
    return Department(
      id: id,
      name: data['name'] ?? '',
      country: data['country'] ?? '',
      hasSeaAccess: data['hasSeaAccess'] ?? false,
      state: data['state'] ?? false,
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  /// Convierte `Department` a un mapa para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'country': country,
      'hasSeaAccess': hasSeaAccess,
      'state': state,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
