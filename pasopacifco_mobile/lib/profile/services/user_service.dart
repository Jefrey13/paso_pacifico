import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pasopacifco_mobile/profile/models/UserProfile.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // **Obtener perfil de usuario autenticado**
  Future<UserProfile> getUserProfile() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Exception("No hay un usuario autenticado.");
    }

    try {
      final email = currentUser.email;
      if (email == null || email.isEmpty) {
        throw Exception("El correo del usuario autenticado no es válido.");
      }

      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception(
            "No se encontró un perfil asociado al correo del usuario autenticado.");
      }

      final doc = querySnapshot.docs.first;

      // Retornar el perfil de usuario como un objeto UserProfile
      return UserProfile.fromMap(doc.data());
    } on FirebaseException catch (e) {
      throw Exception(
          "Error al obtener el perfil del usuario autenticado: ${e.message}");
    }
  }

  // **Actualizar nombre completo**
  Future<void> updateUserName(String newName) async {
    if (newName.isEmpty) {
      throw Exception("El nombre no puede estar vacío.");
    }

    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Exception("No hay un usuario autenticado.");
    }

    try {
      final email = currentUser.email;
      if (email == null || email.isEmpty) {
        throw Exception("El correo del usuario autenticado no es válido.");
      }

      // Obtener el documento correspondiente en Firestore
      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception(
            "No se encontró un perfil asociado al usuario autenticado.");
      }

      final docId = querySnapshot.docs.first.id;

      // Actualizar el nombre en Firestore
      await _firestore
          .collection('users')
          .doc(docId)
          .update({'displayName': newName});
    } on FirebaseException catch (e) {
      throw Exception("Error al actualizar el nombre: ${e.message}");
    }
  }

  // **Actualizar correo electrónico**
  Future<void> updateUserEmail(String newEmail) async {
    if (newEmail.isEmpty) {
      throw Exception("El correo electrónico no puede estar vacío.");
    }

    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Exception("No hay un usuario autenticado.");
    }

    try {
      // Verificar si el nuevo correo ya está en uso
      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: newEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception("El correo electrónico ya está en uso.");
      }

      // Actualizar el correo en Firebase Authentication
      await currentUser.updateEmail(newEmail);

      // Obtener el documento correspondiente en Firestore
      final email = currentUser.email;
      if (email == null || email.isEmpty) {
        throw Exception("El correo del usuario autenticado no es válido.");
      }

      final querySnapshot2 = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot2.docs.isEmpty) {
        throw Exception(
            "No se encontró un perfil asociado al usuario autenticado.");
      }

      final docId = querySnapshot2.docs.first.id;

      // Actualizar el correo en Firestore
      await _firestore
          .collection('users')
          .doc(docId)
          .update({'email': newEmail});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception(
            "El correo electrónico ya está registrado en Firebase Authentication.");
      } else if (e.code == 'requires-recent-login') {
        throw Exception(
            "El usuario debe volver a iniciar sesión para realizar esta acción.");
      } else {
        throw Exception("Error al actualizar el correo: ${e.message}");
      }
    } on FirebaseException catch (e) {
      throw Exception(
          "Error al actualizar el correo en Firestore: ${e.message}");
    }
  }

  // **Actualizar número de teléfono**
  Future<void> updateUserPhone(String newPhone) async {
    if (newPhone.isEmpty) {
      throw Exception("El número de teléfono no puede estar vacío.");
    }

    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Exception("No hay un usuario autenticado.");
    }

    try {
      final email = currentUser.email;
      if (email == null || email.isEmpty) {
        throw Exception("El correo del usuario autenticado no es válido.");
      }

      // Obtener el documento correspondiente en Firestore
      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception(
            "No se encontró un perfil asociado al usuario autenticado.");
      }

      final docId = querySnapshot.docs.first.id;

      // Actualizar el número de teléfono en Firestore
      await _firestore
          .collection('users')
          .doc(docId)
          .update({'phoneNumber': newPhone});
    } on FirebaseException catch (e) {
      throw Exception(
          "Error al actualizar el número de teléfono: ${e.message}");
    }
  }
}
