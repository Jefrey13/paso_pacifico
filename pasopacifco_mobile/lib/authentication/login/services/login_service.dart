import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Inicia sesión con email y contraseña.
  ///
  /// [email]: Correo electrónico del usuario.
  /// [password]: Contraseña del usuario.
  ///
  /// Retorna un objeto [User] si el inicio de sesión es exitoso.
  /// Lanza una excepción con un mensaje descriptivo si ocurre un error.
  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Inicia sesión con Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Manejo de errores específicos de FirebaseAuth
      switch (e.code) {
        case 'wrong-password':
          throw Exception("La contraseña es incorrecta.");
        case 'invalid-email':
          throw Exception("El correo electrónico no es válido.");
        default:
          throw Exception("Credenciales no validas.");
        //throw Exception("Credenciales no validas: ${e.message}");
      }
    } catch (e) {
      // Manejo de errores genéricos
      throw Exception("Error al iniciar sesión: $e");
    }
  }
}
