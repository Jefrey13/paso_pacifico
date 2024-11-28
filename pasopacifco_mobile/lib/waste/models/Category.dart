import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id; // Identificador único
  final String name; // Nombre de la categoría
  final bool state; // Estado de la categoría (activo/inactivo)

  Category({
    required this.id,
    required this.name,
    required this.state,
  });

  // Crear una instancia de Category desde un mapa (como los datos de Firestore)
  factory Category.fromMap(Map<String, dynamic> data, String id) {
    return Category(
      id: id,
      name: data['name'] ?? '',
      state: data['state'] ?? true, // Por defecto activo
    );
  }

  // Convertir el objeto Category a un mapa para guardar en Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'state': state,
    };
  }
}
