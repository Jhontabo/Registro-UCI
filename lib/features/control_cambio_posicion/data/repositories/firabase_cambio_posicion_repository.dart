import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/dto/create_cambio_posicion_dto.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/abstract_repositories/cambio_posicion_repository.dart';

class FirebaseCambioPosicionRepository implements CambioPosicionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
    CreateCambioPosicionDto dto,
  ) async {
    try {
      final cambiosRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosPosicion')
          .doc(idCambioPosicion);

      await cambiosRef.set(dto.toFirestore());
    } catch (e) {
      throw Exception('Error al crear cambio de posición: $e');
    }
  }

  @override
  Future<void> updateCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
    CreateCambioPosicionDto dto,
  ) async {
    try {
      final cambioRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosPosicion')
          .doc(idCambioPosicion);

      await cambioRef.update(dto.toFirestore());
    } catch (e) {
      throw Exception('Error al actualizar cambio de posición: $e');
    }
  }

  @override
  Future<void> deleteCambioPosicion(
    String idIngreso,
    String idRegistroDiario,
    String idCambioPosicion,
  ) async {
    try {
      final cambioRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosPosicion')
          .doc(idCambioPosicion);

      await cambioRef.delete();
    } catch (e) {
      throw Exception('Error al eliminar cambio de posición: $e');
    }
  }

  @override
  Future<List<CambioDePosicion>> getCambiosDePosicion(
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
          .orderBy('hora')
          .get();

      return querySnapshot.docs
          .map((doc) => CambioDePosicion.fromFirestore(doc, null))
          .toList();
    } catch (e) {
      throw Exception('Error al obtener cambios de posición: $e');
    }
  }

  @override
  Future<List<CambioDePosicion>> getCambiosDePosicionFromPreviousHour(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    try {
      final previousHour =
          DateTime.now().subtract(const Duration(hours: 1)).hour;

      final querySnapshot = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosPosicion')
          .where('hora', isEqualTo: previousHour)
          .get();

      return querySnapshot.docs
          .map((doc) => CambioDePosicion.fromFirestore(doc, null))
          .toList();
    } catch (e) {
      throw Exception(
          'Error al obtener cambios de posición de la hora anterior: $e');
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
      return CambioDePosicion.fromFirestore(querySnapshot.docs.first, null);
    } catch (e) {
      throw Exception('Error al obtener último cambio de posición: $e');
    }
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
      return CambioDePosicion.fromFirestore(doc, null);
    } catch (e) {
      throw Exception('Error al obtener cambio de posición por ID: $e');
    }
  }

  @override
  Future<Map<String, int>> getResumenPosiciones(
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
}
