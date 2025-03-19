import 'package:cloud_firestore/cloud_firestore.dart';
import '../abstract_repositories/sonda_repository.dart';
import '../../domain/models/sonda.dart';

class FirebaseSondaRepository implements SondaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createSonda(Sonda sonda, String idIngreso) async {
    try {
      await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('sondas')
          .doc(sonda.id)
          .set(sonda.toJson());
    } catch (e) {
      throw Exception('Error al crear la sonda: $e');
    }
  }

  @override
  Future<void> updateSonda(Sonda sonda, String idIngreso) async {
    try {
      await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('sondas')
          .doc(sonda.id)
          .update(sonda.toJson());
    } catch (e) {
      throw Exception('Error al actualizar la sonda: $e');
    }
  }

  @override
  Future<void> deleteSonda(String id, String idIngreso) async {
    try {
      await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('sondas')
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception('Error al eliminar la sonda: $e');
    }
  }

  @override
  Stream<List<Sonda>> getSondas(String idIngreso) {
    return _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('sondas')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) {
            final data = doc.data() as Map<String, dynamic>?;
            if (data == null) return null;
            return Sonda.fromJson(data);
          })
          .whereType<Sonda>()
          .toList();
    });
  }

  /// Nuevo método para obtener una sonda por su `id` y `idIngreso`
  @override
  Future<Sonda?> getSondaById(String id, String idIngreso) async {
    try {
      final doc = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('sondas')
          .doc(id)
          .get();

      if (!doc.exists) return null; // Si no existe, retorna `null`

      final data = doc.data();
      if (data == null) return null;

      return Sonda.fromJson(data);
    } catch (e) {
      throw Exception('Error al obtener la sonda por ID: $e');
    }
  }
}
