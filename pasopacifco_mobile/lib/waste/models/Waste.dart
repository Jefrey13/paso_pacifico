import 'package:cloud_firestore/cloud_firestore.dart';

class Waste {
  final String
      id; // Identificador único del residuo (por ejemplo, generado automáticamente)
  final String name; // Nombre del residuo (ej. "Puntas de puros")
  final String description; // Descripción del residuo
  final String category; // Categoría de residuos, como "Otros residuos"
  final bool state;
  final DateTime createdAt; // Fecha de creación del residuo

  // Constructor
  Waste({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.state,
    required this.createdAt,
  });

  // Crear una instancia de Waste desde un mapa (como los datos de Firestore)
  factory Waste.fromMap(Map<String, dynamic> data, String id) {
    return Waste(
      id: id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      state: true,
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  // Convertir el objeto Waste a un mapa para guardar en Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'state': state,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
