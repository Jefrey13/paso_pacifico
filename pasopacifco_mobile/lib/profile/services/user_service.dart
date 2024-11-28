import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pasopacifco_mobile/profile/models/UserProfile.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // **Obtener perfil de usuario por ID**
  Future<UserProfile> getUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (!doc.exists) {
        throw Exception("El perfil del usuario no existe.");
      }

      return UserProfile.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      throw Exception("Error al obtener el perfil: ${e.message}");
    }
  }

  // **Obtener perfil de usuario por Email**
  Future<UserProfile> getUserProfileByEmail(String email) async {
    try {
      // Consulta directa buscando el email único
      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception("El perfil del usuario no existe.");
      }

      // Solo debería haber un documento, lo tomamos directamente
      final doc = querySnapshot.docs.first;

      return UserProfile.fromMap(doc.data());
    } on FirebaseException catch (e) {
      throw Exception("Error al obtener el perfil por email: ${e.message}");
    }
  }

  // **Actualizar perfil de usuario**
  Future<void> updateUserProfile(
      String userId, UserProfile updatedProfile) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .update(updatedProfile.toMap());
    } on FirebaseException catch (e) {
      throw Exception("Error al actualizar el perfil: ${e.message}");
    }
  }
}
