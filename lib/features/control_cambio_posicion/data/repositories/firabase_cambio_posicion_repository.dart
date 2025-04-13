import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/abstract_repositories/cambio_posicion_repository.dart';

class FirebaseCambioPosicionRepository implements CambioPosicionRepository {
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
        .collection('cambiosPosicion');
  }

  @override
  Future<List<CambioDePosicion>> getCambiosDePosicion(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    final querySnapshot = await _getCollectionRef(idIngreso, idRegistroDiario)
        .orderBy('orden', descending: false)
        .get();

    return querySnapshot.docs.map((doc) {
      return CambioDePosicion.fromJson(doc.data(), id: doc.id);
    }).toList();
  }

  @override
  Future<CambioDePosicion?> getCambioPosicionById(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  ) async {
    try {
      final doc = await _getCollectionRef(idIngreso, idRegistroDiario)
          .doc(idCambioPosicion)
          .get();

      if (!doc.exists) return null;

      return CambioDePosicion.fromJson(
        doc.data()!,
        id: doc.id,
      );
    } catch (e) {
      throw Exception('Error al obtener cambio de posición por ID: $e');
    }
  }

  @override
  Future<CambioDePosicion?> getUltimoCambioPosicion(
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
      return CambioDePosicion.fromJson(doc.data(), id: doc.id);
    } catch (e) {
      throw Exception('Error al obtener último cambio de posición: $e');
    }
  }

  @override
  Future<void> guardarCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    int hora,
    String posicion,
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
        'idCambioDePosicion': nuevoDoc.id,
        'hora': hora,
        'posicion': posicion,
        'orden': nuevoOrden,
      });
    } catch (e) {
      throw Exception('Error al crear cambio de posición: $e');
    }
  }

  @override
  Future<void> actualizarCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
    int hora,
    String posicion, {
    int? orden,
  }) async {
    try {
      final updateData = {
        'hora': hora,
        'posicion': posicion,
      };

      if (orden != null) {
        updateData['orden'] = orden;
      }

      await _getCollectionRef(idIngreso, idRegistroDiario)
          .doc(idCambioPosicion)
          .update(updateData);
    } catch (e) {
      throw Exception('Error al actualizar cambio de posición: $e');
    }
  }

  @override
  Future<void> eliminarCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  ) async {
    try {
      await _getCollectionRef(idIngreso, idRegistroDiario)
          .doc(idCambioPosicion)
          .delete();
    } catch (e) {
      throw Exception('Error al eliminar cambio de posición: $e');
    }
  }

  @override
  Future<Map<String, int>> getResumenPosiciones(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    try {
      final querySnapshot = await _getCollectionRef(idIngreso, idRegistroDiario)
          .orderBy('orden')
          .get();

      final resumen = <String, int>{};

      for (final doc in querySnapshot.docs) {
        final posicion = doc['posicion'] as String;
        resumen[posicion] = (resumen[posicion] ?? 0) + 1;
      }

      return resumen;
    } catch (e) {
      throw Exception('Error al obtener resumen de posiciones: $e');
    }
  }

  @override
  Future<void> reordenarCambiosPosicion(
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
      throw Exception('Error al reordenar cambios de posición: $e');
    }
  }
}
