import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Registra un usuario con email, contraseña, nombre completo, nombre de usuario y número telefónico.
  Future<User?> registerUser({
    required String email,
    required String password,
    required String displayName,
    required String username,
    required String phoneNumber,
  }) async {
    try {
      // Validar entradas
      validateInputs(
        email: email,
        password: password,
        displayName: displayName,
        username: username,
        phoneNumber: phoneNumber,
      );

      // Verifica si el nombre de usuario ya está en uso
      final usernameQuery = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (usernameQuery.docs.isNotEmpty) {
        throw Exception("El nombre de usuario ya está en uso.");
      }

      // Crea el usuario en Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Actualiza el nombre completo del usuario
      await userCredential.user?.updateDisplayName(displayName);

      // Guarda los datos del usuario en Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'uid': userCredential.user?.uid,
        'username': username,
        'displayName': displayName,
        'email': email,
        'phoneNumber': phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception("El correo electrónico ya está en uso.");
        case 'weak-password':
          throw Exception("La contraseña es demasiado débil.");
        case 'invalid-email':
          throw Exception("El correo electrónico no es válido.");
        default:
          throw Exception("Error de autenticación: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error al registrar usuario: $e");
    }
  }

  void validateInputs({
    required String email,
    required String password,
    required String displayName,
    required String username,
    required String phoneNumber,
  }) {
    if (email.isEmpty) throw Exception("El correo electrónico es obligatorio.");
    if (password.isEmpty) throw Exception("La contraseña es obligatoria.");
    if (password.length < 6)
      throw Exception("La contraseña debe tener al menos 6 caracteres.");
    if (displayName.isEmpty)
      throw Exception("El nombre completo es obligatorio.");
    if (username.isEmpty)
      throw Exception("El nombre de usuario es obligatorio.");
    if (phoneNumber.isEmpty)
      throw Exception("El número telefónico es obligatorio.");
  }
}
