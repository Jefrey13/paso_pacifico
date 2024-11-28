import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasopacifco_mobile/waste/models/Waste.dart';

class WasteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // **Crear un nuevo residuo**
  Future<void> createWaste(Waste waste) async {
    try {
      // Verificar si el nombre del residuo ya existe
      final existingWasteQuery = await _firestore
          .collection('wastes')
          .where('name', isEqualTo: waste.name)
          .get();

      if (existingWasteQuery.docs.isNotEmpty) {
        throw Exception("Ya existe un residuo con el nombre '${waste.name}'");
      }

      // Agregar el residuo
      await _firestore.collection('wastes').add(waste.toMap());
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    } catch (e) {
      _handleGenericException(e);
    }
  }

  // **Obtener todos los residuos activos**
  Future<List<Waste>> getAllActiveWastes() async {
    try {
      final snapshot = await _firestore
          .collection('wastes')
          .where('state', isEqualTo: true) // Solo activos
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception("No se encontraron residuos activos.");
      }

      return snapshot.docs
          .map((doc) => Waste.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
      return []; // No se alcanzará si se lanza una excepción
    } catch (e) {
      _handleGenericException(e);
      return []; // No se alcanzará si se lanza una excepción
    }
  }

  // **Obtener un residuo por ID**
  Future<Waste> getWasteById(String wasteId) async {
    try {
      final doc = await _firestore.collection('wastes').doc(wasteId).get();

      if (!doc.exists) {
        throw Exception("El residuo con ID $wasteId no existe.");
      }

      return Waste.fromMap(doc.data()!, doc.id);
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
      rethrow; // Relanzar la excepción si se desea manejarla más arriba
    } catch (e) {
      _handleGenericException(e);
      rethrow; // Relanzar la excepción si se desea manejarla más arriba
    }
  }

  // **Actualizar un residuo**
  Future<void> updateWaste(String wasteId, Waste updatedWaste) async {
    try {
      // Verificar si el residuo existe antes de actualizarlo
      final doc = await _firestore.collection('wastes').doc(wasteId).get();

      if (!doc.exists) {
        throw Exception("El residuo con ID $wasteId no existe.");
      }

      await _firestore
          .collection('wastes')
          .doc(wasteId)
          .update(updatedWaste.toMap());
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    } catch (e) {
      _handleGenericException(e);
    }
  }

  // **Eliminar un residuo (cambiar estado a desactivado)**
  Future<void> deactivateWaste(String wasteId) async {
    try {
      // Verificar si el residuo existe antes de desactivarlo
      final doc = await _firestore.collection('wastes').doc(wasteId).get();

      if (!doc.exists) {
        throw Exception("El residuo con ID $wasteId no existe.");
      }

      await _firestore
          .collection('wastes')
          .doc(wasteId)
          .update({'state': false});
      Fluttertoast.showToast(
        msg: "Residuo desactivado exitosamente.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
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
    Fluttertoast.showToast(
      msg: errorMessage,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  // **Manejo de excepciones generales**
  void _handleGenericException(Object e) {
    String errorMessage = "Error inesperado: $e";
    Fluttertoast.showToast(
      msg: errorMessage,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
