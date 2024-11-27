import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pasopacifco_mobile/sites/models/Department.dart';
import 'package:pasopacifco_mobile/sites/models/Municipality.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Obtener todos los departamentos
  Future<List<Department>> getAllDepartments() async {
    try {
      final snapshot = await _firestore
          .collection("departments")
          .where("state", isEqualTo: true) // Solo departamentos activos
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception("No se encontraron departamentos activos.");
      }

      return snapshot.docs
          .map((doc) => Department.fromFirestore(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      throw Exception("Error al obtener los departamentos: ${e.message}");
    } catch (e) {
      throw Exception("Error inesperado al obtener los departamentos: $e");
    }
  }

  /// Obtener municipios de un departamento específico
  Future<List<Municipality>> getMunicipalitiesByDepartment(
      String departmentId) async {
    try {
      final snapshot = await _firestore
          .collection("municipalities")
          .where("departmentId",
              isEqualTo: departmentId) // Filtrar por departamento
          .where("state", isEqualTo: true) // Solo municipios activos
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception(
            "No se encontraron municipios activos para el departamento especificado.");
      }

      return snapshot.docs
          .map((doc) => Municipality.fromFirestore(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      throw Exception(
          "Error al obtener los municipios del departamento: ${e.message}");
    } catch (e) {
      throw Exception(
          "Error inesperado al obtener los municipios del departamento: $e");
    }
  }

  /// Obtener un departamento por ID
  Future<Department> getDepartmentById(String departmentId) async {
    try {
      final doc =
          await _firestore.collection("departments").doc(departmentId).get();

      if (!doc.exists) {
        throw Exception("El departamento con ID $departmentId no existe.");
      }

      return Department.fromFirestore(doc.data()!, doc.id);
    } on FirebaseException catch (e) {
      throw Exception("Error al obtener el departamento: ${e.message}");
    } catch (e) {
      throw Exception("Error inesperado al obtener el departamento: $e");
    }
  }

  /// Obtener un municipio por ID
  Future<Municipality> getMunicipalityById(String municipalityId) async {
    try {
      final doc = await _firestore
          .collection("municipalities")
          .doc(municipalityId)
          .get();

      if (!doc.exists) {
        throw Exception("El municipio con ID $municipalityId no existe.");
      }

      return Municipality.fromFirestore(doc.data()!, doc.id);
    } on FirebaseException catch (e) {
      throw Exception("Error al obtener el municipio: ${e.message}");
    } catch (e) {
      throw Exception("Error inesperado al obtener el municipio: $e");
    }
  }
}
