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
    final cambiosPosicionRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('cambiosPosicion');

    final querySnapshot =
        await cambiosPosicionRef.orderBy('orden', descending: false).get();

    final cambiosPosicion = querySnapshot.docs.map((doc) {
      return CambioDePosicion.fromJson(doc.data(),
          id: doc.id); // Pasamos el ID aquí
    }).toList();

    return cambiosPosicion;
  }

  @override
  Future<CambioDePosicion?> getCambioPosicionById(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  ) async {
    try {
      final doc = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosPosicion')
          .doc(idCambioPosicion)
          .get();

      if (!doc.exists) return null;

      return CambioDePosicion.fromJson(
        doc.data() as Map<String, dynamic>, // Usamos los datos del documento
        id: doc.id, // Le pasamos el ID del documento
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
      final querySnapshot = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosPosicion')
          .orderBy('hora', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) return null;

      final doc = querySnapshot.docs.first;

      // Aquí se pasa el id correctamente al constructor desde doc.id
      return CambioDePosicion.fromJson(
        doc.data(), // Asegúrate de que los datos sean un Map
        id: doc.id, // Pasamos el ID de Firestore aquí
      );
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
      final nuevoDoc = _getCollectionRef(idIngreso, idRegistroDiario).doc();

      await nuevoDoc.set({
        'id': nuevoDoc.id,
        'hora': hora,
        'posicion': posicion,
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
    String posicion,
  ) async {
    try {
      await _getCollectionRef(idIngreso, idRegistroDiario)
          .doc(idCambioPosicion)
          .update({
        'hora': hora,
        'posicion': posicion,
      });
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
      final querySnapshot =
          await _getCollectionRef(idIngreso, idRegistroDiario).get();

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
}
