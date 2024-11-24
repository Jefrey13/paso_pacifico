import 'package:cloud_firestore/cloud_firestore.dart';

class Site {
  final String id; // ID del sitio (generado automáticamente por Firestore)
  final String name;
  final String closestCrossing; // Cruce más cercano
  final String
      departmentId; // ID del departamento (referencia a la colección de departamentos)
  final String
      municipalityId; // ID del municipio (referencia a la colección de municipios)
  final String country; // País (Nicaragua en este caso)
  final List<String>
      cleaningModes; // Modalidades de limpieza (Terrestre, Embarcación, Submarina)
  final String?
      imageUrl; // URL de la imagen (puede ser nulo si no se ha subido una imagen)
  final bool state;
  final DateTime? createdAt;

  Site({
    required this.id,
    required this.name,
    required this.closestCrossing,
    required this.departmentId,
    required this.municipalityId,
    required this.country,
    required this.cleaningModes,
    this.imageUrl,
    required this.state,
    this.createdAt,
  });

  //// Crea una instancia de `Site` desde un documento Firestore
  factory Site.fromFirestore(Map<String, dynamic> data, String id) {
    return Site(
      id: id,
      name: data['name'] ?? '',
      closestCrossing: data['closestCrossing'] ?? '',
      departmentId: data['departmentId'] ?? '',
      municipalityId: data['municipalityId'] ?? '',
      country: data['country'] ?? 'Nicaragua',
      cleaningModes: List<String>.from(data['cleaningModes'] ?? []),
      imageUrl: data['imageUrl'], // Puede ser nulo si no se proporciona
      state: data['state'] ?? false, // Default: inactivo
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  /// Convierte la instancia de `Site` a un mapa para guardar en Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'closestCrossing': closestCrossing,
      'departmentId': departmentId,
      'municipalityId': municipalityId,
      'country': country,
      'cleaningModes': cleaningModes,
      'imageUrl': imageUrl, // Puede ser nulo si no se proporciona
      'state': state, // true para activo, false para inactivo
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
