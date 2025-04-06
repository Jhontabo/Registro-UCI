import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/constants/intervenciones.dart'; // Asegúrate de que este archivo defina el mapa `mapaIntervenciones`
import 'package:registro_uci/features/intervenciones/data/abstract_repositories/intervenciones_de_registro_repository.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';

class HybridIntervencionesDeRegistroRepository
    implements IntervencionesDeRegistroRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> agregarIntervencionesARegistro(
    String idIngreso,
    String idRegistro,
    List<String> idsIntervenciones,
  ) async {
    final batch = _firestore.batch();

    try {
      final registroRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistro);

      for (final idIntervencion in idsIntervenciones) {
        final intervencionInRegistroRef =
            registroRef.collection('intervenciones').doc(idIntervencion);
        // Solo se almacena el campo 'idIntervencion'
        batch.set(intervencionInRegistroRef, {
          'idIntervencion': idIntervencion,
        });
      }

      await batch.commit();
    } catch (e) {
      log('Error al agregar intervenciones al registro (Hybrid): $e');
      throw Exception('Error al agregar intervenciones al registro (Hybrid)');
    }
  }

  @override
  Future<void> eliminarIntervencionDeRegistro(
    String idIngreso,
    String idRegistro,
    String idIntervencion,
  ) async {
    try {
      final intervencionInRegistroRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistro)
          .collection('intervenciones')
          .doc(idIntervencion);

      await intervencionInRegistroRef.delete();
    } catch (e) {
      log('Error al eliminar la intervención del registro (Hybrid): $e');
      throw Exception(
          'Error al eliminar la intervención del registro (Hybrid)');
    }
  }

  @override
  Future<List<Intervencion>> getIntervencionesDeRegistro(
    String idIngreso,
    String idRegistro,
  ) async {
    try {
      final intervencionesSnapshot = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistro)
          .collection('intervenciones')
          .get();

      // Se usa el ID del documento para buscar en el mapa local.
      final intervenciones = intervencionesSnapshot.docs.map((doc) {
        final intervencionId = doc.id;
        final intervencion = mapaIntervenciones[intervencionId] ??
            const Intervencion(idIntervencion: '0', idNIC: '0', nombre: '');
        return intervencion;
      }).toList();

      return intervenciones;
    } catch (e) {
      log('Error al obtener las intervenciones del registro (Hybrid): $e');
      throw Exception(
          'Error al obtener las intervenciones del registro (Hybrid)');
    }
  }

  @override
  Future<void> importIntervencionesFromRegistro(
    String idIngreso,
    String originRegistro,
    String targetRegistro,
  ) async {
    final batch = _firestore.batch();

    try {
      final originRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(originRegistro)
          .collection('intervenciones');

      final targetRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(targetRegistro)
          .collection('intervenciones');

      final originIntervencionesSnapshot = await originRef.get();

      for (var doc in originIntervencionesSnapshot.docs) {
        final data = doc.data();
        final idIntervencion = doc.id;
        batch.set(targetRef.doc(idIntervencion), data);
      }

      await batch.commit();
    } catch (e) {
      log('Error al importar intervenciones del registro (Hybrid): $e');
      throw Exception('Error al importar intervenciones del registro (Hybrid)');
    }
  }
}
