import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Cambia la contraseña del usuario.
  ///
  /// [currentPassword]: Contraseña actual del usuario.
  /// [newPassword]: Nueva contraseña.
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception("Usuario no autenticado.");
      }

      // Reautenticar al usuario
      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(cred);

      // Actualizar la contraseña
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      // Manejo de errores específicos de FirebaseAuth
      switch (e.code) {
        case 'wrong-password':
          throw Exception("La contraseña actual es incorrecta.");
        case 'weak-password':
          throw Exception("La nueva contraseña es demasiado débil.");
        default:
          throw Exception("La contraseña no es válida, por favor verifique.");
      }
    } catch (e) {
      // Manejo de errores genéricos
      throw Exception("Error al cambiar la contraseña: $e");
    }
  }
}
