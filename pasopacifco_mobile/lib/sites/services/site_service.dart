import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/site.dart';

class SiteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Agregar un nuevo sitio a Firestore
  Future<void> createSite(Site site) async {
    try {
      // Verificar si el municipio y el departamento existen
      final departmentDoc = await _firestore
          .collection('departments')
          .doc(site.departmentId)
          .get();
      if (!departmentDoc.exists) {
        throw Exception(
            "El departamento con ID ${site.departmentId} no existe.");
      }

      final municipalityDoc = await _firestore
          .collection('municipalities')
          .doc(site.municipalityId)
          .get();
      if (!municipalityDoc.exists) {
        throw Exception(
            "El municipio con ID ${site.municipalityId} no existe.");
      }

      // Verificar si ya existe un sitio con el mismo nombre en el municipio
      final existingSiteQuery = await _firestore
          .collection('sites')
          .where('name', isEqualTo: site.name)
          .where('municipalityId', isEqualTo: site.municipalityId)
          .get();

      if (existingSiteQuery.docs.isNotEmpty) {
        throw Exception(
            "Ya existe un sitio con el nombre '${site.name}' en este municipio.");
      }

      // Agregar el sitio
      await _firestore.collection('sites').add(site.toFirestore());
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'not-found':
          throw Exception(
              "No se encontró una referencia requerida durante la creación del sitio.");
        case 'permission-denied':
          throw Exception("No tienes permisos para agregar un sitio.");
        case 'unavailable':
          throw Exception("El servicio de Firestore no está disponible.");
        default:
          throw Exception("Error al crear el sitio: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error al crear el sitio: $e");
    }
  }

  /// Obtener todos los sitios activos
  Future<List<Site>> getAllActiveSites() async {
    try {
      final querySnapshot = await _firestore
          .collection('sites')
          .where('state', isEqualTo: true) // Solo sitios activos
          .get();

      return querySnapshot.docs
          .map((doc) => Site.fromFirestore(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw Exception("No tienes permisos para leer los sitios.");
        case 'unavailable':
          throw Exception("El servicio de Firestore no está disponible.");
        default:
          throw Exception("Error al obtener los sitios: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error al obtener los sitios: $e");
    }
  }

  /// Obtener un sitio por su ID
  Future<Site?> getSiteById(String siteId) async {
    try {
      final doc = await _firestore.collection('sites').doc(siteId).get();

      if (!doc.exists) {
        throw Exception("El sitio con ID $siteId no existe.");
      }

      return Site.fromFirestore(doc.data()!, doc.id);
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'not-found':
          throw Exception("El sitio con ID $siteId no existe.");
        case 'permission-denied':
          throw Exception("No tienes permisos para leer el sitio.");
        case 'unavailable':
          throw Exception("El servicio de Firestore no está disponible.");
        default:
          throw Exception("Error al obtener el sitio: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error al obtener el sitio: $e");
    }
  }

  /// Actualizar un sitio existente
  Future<void> updateSite(String siteId, Site updatedSite) async {
    try {
      // Verificar si el sitio existe
      final siteDoc = await _firestore.collection('sites').doc(siteId).get();
      if (!siteDoc.exists) {
        throw Exception("El sitio con ID $siteId no existe.");
      }

      // Verificar si el municipio y el departamento existen
      final departmentDoc = await _firestore
          .collection('departments')
          .doc(updatedSite.departmentId)
          .get();
      if (!departmentDoc.exists) {
        throw Exception(
            "El departamento con ID ${updatedSite.departmentId} no existe.");
      }

      final municipalityDoc = await _firestore
          .collection('municipalities')
          .doc(updatedSite.municipalityId)
          .get();
      if (!municipalityDoc.exists) {
        throw Exception(
            "El municipio con ID ${updatedSite.municipalityId} no existe.");
      }

      // Actualizar el sitio
      await _firestore
          .collection('sites')
          .doc(siteId)
          .update(updatedSite.toFirestore());
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'not-found':
          throw Exception(
              "No se encontró una referencia requerida durante la actualización del sitio.");
        case 'permission-denied':
          throw Exception("No tienes permisos para actualizar este sitio.");
        case 'unavailable':
          throw Exception("El servicio de Firestore no está disponible.");
        default:
          throw Exception("Error al actualizar el sitio: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error al actualizar el sitio: $e");
    }
  }

  /// Cambiar el estado de un sitio (activar o desactivar)
  Future<void> toggleSiteState(String siteId, bool isActive) async {
    try {
      // Verificar si el sitio existe
      final siteDoc = await _firestore.collection('sites').doc(siteId).get();
      if (!siteDoc.exists) {
        throw Exception("El sitio con ID $siteId no existe.");
      }

      // Actualizar el estado
      await _firestore
          .collection('sites')
          .doc(siteId)
          .update({'state': isActive});
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'not-found':
          throw Exception("El sitio con ID $siteId no existe.");
        case 'permission-denied':
          throw Exception(
              "No tienes permisos para cambiar el estado del sitio.");
        case 'unavailable':
          throw Exception("El servicio de Firestore no está disponible.");
        default:
          throw Exception("Error al cambiar el estado del sitio: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error al cambiar el estado del sitio: $e");
    }
  }
}
