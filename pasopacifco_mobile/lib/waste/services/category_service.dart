import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pasopacifco_mobile/waste/models/Category.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // **Obtener todas las categorías activas**
  Future<List<Category>> getAllActiveCategories() async {
    try {
      final snapshot = await _firestore
          .collection('categories')
          .where('state', isEqualTo: true) // Solo categorías activas
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception("No se encontraron categorías activas.");
      }

      return snapshot.docs
          .map((doc) => Category.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
      return []; // Retornamos una lista vacía en caso de error
    } catch (e) {
      _handleGenericException(e);
      return []; // Retornamos una lista vacía en caso de error
    }
  }

  // **Obtener la categoría por id**
  Future<Category> getCategoryById(String categoryId) async {
    try {
      final doc =
          await _firestore.collection('categories').doc(categoryId).get();

      if (!doc.exists) {
        throw Exception("La categoría con ID $categoryId no existe.");
      }

      return Category.fromMap(doc.data()!, doc.id);
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
      rethrow; // Relanzar la excepción para manejarla más arriba
    } catch (e) {
      _handleGenericException(e);
      rethrow; // Relanzar la excepción para manejarla más arriba
    }
  }

  // **Crear las categorías predeterminadas**
  Future<void> createDefaultCategories() async {
    final categories = [
      "Objetos más comúnmente encontrados",
      "Avíos de pesca",
      "Materiales de empaque",
      "Otros residuos",
      "Higiene personal",
      "Basura pequeña menos de 2.5cm",
    ];

    try {
      for (String categoryName in categories) {
        // Verificar si la categoría ya existe
        final existingCategoryQuery = await _firestore
            .collection('categories')
            .where('name', isEqualTo: categoryName)
            .get();

        // Si no existe, la agregamos
        if (existingCategoryQuery.docs.isEmpty) {
          await _firestore.collection('categories').add({
            'name': categoryName,
            'state': true, // Establecemos como activo
          });
          print("Categoría '$categoryName' agregada correctamente.");
        } else {
          print("La categoría '$categoryName' ya existe.");
        }
      }

      print("Categorías predeterminadas creadas exitosamente.");
    } catch (e) {
      _handleGenericException(e);
    }
  }

  // **Actualizar una categoría**
  Future<void> updateCategory(
      String categoryId, Category updatedCategory) async {
    try {
      final doc =
          await _firestore.collection('categories').doc(categoryId).get();

      if (!doc.exists) {
        throw Exception("La categoría con ID $categoryId no existe.");
      }

      await _firestore
          .collection('categories')
          .doc(categoryId)
          .update(updatedCategory.toMap());
      print("Categoría actualizada correctamente.");
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    } catch (e) {
      _handleGenericException(e);
    }
  }

  // **Desactivar una categoría (cambiar estado a desactivado)**
  Future<void> deactivateCategory(String categoryId) async {
    try {
      final doc =
          await _firestore.collection('categories').doc(categoryId).get();

      if (!doc.exists) {
        throw Exception("La categoría con ID $categoryId no existe.");
      }

      await _firestore
          .collection('categories')
          .doc(categoryId)
          .update({'state': false});
      print("Categoría desactivada exitosamente.");
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    } catch (e) {
      _handleGenericException(e);
    }
  }

  // **Manejo de excepciones específicas de Firebase**
  void _handleFirebaseException(FirebaseException e) {
    String errorMessage;
    switch (e.code) {
      case 'permission-denied':
        errorMessage = "No tienes permisos para realizar esta operación.";
        break;
      case 'unavailable':
        errorMessage = "El servicio de Firestore no está disponible.";
        break;
      default:
        errorMessage = "Error con la base de datos de Firestore: ${e.message}";
    }
    print("Firebase Error: $errorMessage");
  }

  // **Manejo de excepciones generales**
  void _handleGenericException(Object e) {
    String errorMessage = "Error inesperado: $e";
    print("Error: $errorMessage");
  }
}
