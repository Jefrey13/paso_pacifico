import 'package:cloud_firestore/cloud_firestore.dart';

class Municipality {
  final String id;
  final String name;
  final String departmentId; // Relación con un departamento
  final bool hasSeaAccess;
  final bool state;
  final DateTime? createdAt;

  Municipality({
    required this.id,
    required this.name,
    required this.departmentId,
    required this.hasSeaAccess,
    required this.state,
    this.createdAt,
  });

  /// Crea una instancia de `Municipality` desde Firestore
  factory Municipality.fromFirestore(Map<String, dynamic> data, String id) {
    return Municipality(
      id: id,
      name: data['name'] ?? '',
      departmentId: data['departmentId'] ?? '',
      hasSeaAccess: data['hasSeaAccess'] ?? false,
      state: data['state'] ?? false,
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  /// Convierte `Municipality` a un mapa para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'departmentId': departmentId,
      'hasSeaAccess': hasSeaAccess,
      'state': state,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
