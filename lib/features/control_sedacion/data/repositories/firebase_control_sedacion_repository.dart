import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/control_sedacion/domain/models/control_sedacion.dart';
import 'package:registro_uci/features/control_sedacion/data/abstract_repositories/control_sedacion_repository.dart';

class FirebaseControlSedacionRepository implements ControlSedacionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _getCollectionRef(
    String idIngreso,
    String idRegistroDiario,
  ) {
    return _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlesSedacion');
  }

  @override
  Future<List<ControlSedacion>> getControlesSedacion(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    final querySnapshot = await _getCollectionRef(idIngreso, idRegistroDiario)
        .orderBy('orden', descending: false)
        .get();

    return querySnapshot.docs.map((doc) {
      return ControlSedacion.fromJson(doc.data(), id: doc.id);
    }).toList();
  }

  @override
  Future<ControlSedacion?> getControlSedacionById(
    String idIngreso,
    String idRegistroDiario,
    String idControlSedacion,
  ) async {
    try {
      final doc = await _getCollectionRef(idIngreso, idRegistroDiario)
          .doc(idControlSedacion)
          .get();

      if (!doc.exists) return null;

      return ControlSedacion.fromJson(
        doc.data()!,
        id: doc.id,
      );
    } catch (e) {
      throw Exception('Error al obtener control de sedación por ID: $e');
    }
  }

  @override
  Future<ControlSedacion?> getUltimoControlSedacion(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    try {
      final querySnapshot = await _getCollectionRef(idIngreso, idRegistroDiario)
          .orderBy('hora', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) return null;

      final doc = querySnapshot.docs.first;
      return ControlSedacion.fromJson(doc.data(), id: doc.id);
    } catch (e) {
      throw Exception('Error al obtener último control de sedación: $e');
    }
  }

  @override
  Future<void> guardarControlSedacion(
    String idIngreso,
    String idRegistroDiario,
    int hora,
    String observacion,
    int rass,
  ) async {
    try {
      final collectionRef = _getCollectionRef(idIngreso, idRegistroDiario);
      final nuevoDoc = collectionRef.doc();

      // Obtener el máximo orden actual
      final querySnapshot =
          await collectionRef.orderBy('orden', descending: true).limit(1).get();

      int nuevoOrden = 0;
      if (querySnapshot.docs.isNotEmpty) {
        nuevoOrden = querySnapshot.docs.first.data()['orden'] as int;
        nuevoOrden++;
      }

      await nuevoDoc.set({
        'id': nuevoDoc.id,
        'hora': hora,
        'observacion': observacion,
        'rass': rass,
        'orden': nuevoOrden,
      });
    } catch (e) {
      throw Exception('Error al crear control de sedación: $e');
    }
  }

  @override
  Future<void> actualizarControlSedacion(
    String idIngreso,
    String idRegistroDiario,
    String idControlSedacion,
    int hora,
    String observacion,
    int rass, {
    int? orden,
  }) async {
    try {
      final updateData = {
        'hora': hora,
        'observacion': observacion,
        'rass': rass,
      };

      if (orden != null) {
        updateData['orden'] = orden;
      }

      await _getCollectionRef(idIngreso, idRegistroDiario)
          .doc(idControlSedacion)
          .update(updateData);
    } catch (e) {
      throw Exception('Error al actualizar control de sedación: $e');
    }
  }

  @override
  Future<void> eliminarControlSedacion(
    String idIngreso,
    String idRegistroDiario,
    String idControlSedacion,
  ) async {
    try {
      await _getCollectionRef(idIngreso, idRegistroDiario)
          .doc(idControlSedacion)
          .delete();
    } catch (e) {
      throw Exception('Error al eliminar control de sedación: $e');
    }
  }

  @override
  Future<Map<String, int>> getResumenRASS(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    try {
      final querySnapshot = await _getCollectionRef(idIngreso, idRegistroDiario)
          .orderBy('orden')
          .get();

      final resumen = <String, int>{};

      for (final doc in querySnapshot.docs) {
        final rass = doc['rass'].toString();
        resumen[rass] = (resumen[rass] ?? 0) + 1;
      }

      return resumen;
    } catch (e) {
      throw Exception('Error al obtener resumen de RASS: $e');
    }
  }

  @override
  Future<void> reordenarControlesSedacion(
    String idIngreso,
    String idRegistroDiario,
    List<String> idsEnOrden,
  ) async {
    try {
      final batch = _firestore.batch();
      final collectionRef = _getCollectionRef(idIngreso, idRegistroDiario);

      for (int i = 0; i < idsEnOrden.length; i++) {
        final docRef = collectionRef.doc(idsEnOrden[i]);
        batch.update(docRef, {'orden': i});
      }

      await batch.commit();
    } catch (e) {
      throw Exception('Error al reordenar controles de sedación: $e');
    }
  }
}
