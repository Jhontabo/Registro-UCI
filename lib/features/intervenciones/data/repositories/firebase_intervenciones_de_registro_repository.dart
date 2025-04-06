import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/intervenciones/data/abstract_repositories/intervenciones_de_registro_repository.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';

class FirebaseIntervencionesDeRegistroRepository
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
        // Se obtiene la referencia al documento maestro de la intervención.
        final intervencionRef =
            _firestore.collection('intervenciones').doc(idIntervencion);
        // Se crea un documento en la subcolección del registro y se almacena la referencia.
        final intervencionInRegistroRef =
            registroRef.collection('intervenciones').doc(idIntervencion);

        batch.set(intervencionInRegistroRef, {
          'intervencionRef': intervencionRef,
        });
      }

      await batch.commit();
    } catch (e) {
      log('Error al agregar intervenciones al registro: $e');
      throw Exception('Error al agregar intervenciones al registro');
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
      log('Error al eliminar la intervención del registro: $e');
      throw Exception('Error al eliminar la intervención del registro');
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

      // Por cada documento, se extrae la referencia al documento maestro y se recuperan los datos completos.
      final intervenciones =
          await Future.wait(intervencionesSnapshot.docs.map((doc) async {
        final data = doc.data();
        final DocumentReference intervencionRef = data['intervencionRef'];
        final intervencionSnapshot = await intervencionRef.get();
        final intervencionData =
            intervencionSnapshot.data() as Map<String, dynamic>;
        return Intervencion.fromJson(intervencionData,
            id: intervencionSnapshot.id);
      }).toList());

      return intervenciones;
    } catch (e) {
      log('Error al obtener las intervenciones del registro: $e');
      throw Exception('Error al obtener las intervenciones del registro');
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

      // Se obtienen todas las intervenciones del registro origen.
      final originIntervencionesSnapshot = await originRef.get();

      for (var doc in originIntervencionesSnapshot.docs) {
        final data = doc.data();
        final idIntervencion = doc.id;
        batch.set(targetRef.doc(idIntervencion), data);
      }

      await batch.commit();
    } catch (e) {
      log('Error al importar intervenciones del registro: $e');
      throw Exception('Error al importar intervenciones del registro');
    }
  }
}
