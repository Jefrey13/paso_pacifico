import 'package:cloud_firestore/cloud_firestore.dart';

class TermsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetches the terms and conditions from Firestore.
  Future<Map<String, String>> fetchTermsAndConditions() async {
    try {
      final docSnapshot =
          await _firestore.collection('policies').doc('terms_conditions').get();

      if (docSnapshot.exists) {
        return docSnapshot
            .data()!
            .map((key, value) => MapEntry(key, value.toString()));
      } else {
        throw Exception("Políticas no encontradas.");
      }
    } catch (e) {
      throw Exception("Error al cargar las políticas: $e");
    }
  }
}
