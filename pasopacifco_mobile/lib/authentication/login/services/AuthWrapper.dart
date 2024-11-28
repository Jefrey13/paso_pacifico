import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pasopacifco_mobile/authentication/login/login_screen.dart';
import 'package:pasopacifco_mobile/home/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance
          .authStateChanges(), // Escucha los cambios de autenticación
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator()); // Mientras se conecta
        }

        if (snapshot.hasData) {
          // Usuario autenticado
          return HomeScreen();
        }

        // Usuario no autenticado
        return LoginScreen();
      },
    );
  }
}
