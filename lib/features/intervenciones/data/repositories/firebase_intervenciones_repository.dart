import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/intervenciones/data/abstract_repositories/intervenciones_repository.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/features/intervenciones/domain/models/actividad.dart';

class FirebaseIntervencionesRepository implements IntervencionesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Intervencion>> getIntervenciones() async {
    try {
      final querySnapshot = await _firestore.collection('intervenciones').get();

      return querySnapshot.docs
          .map((doc) => Intervencion.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log('Error al obtener las intervenciones: $e');
      throw Exception('Error al obtener las intervenciones');
    }
  }

  @override
  Future<List<Actividad>> getActividadesDeIntervencion(
      String idIntervencion) async {
    try {
      final querySnapshot = await _firestore
          .collection('intervenciones')
          .doc(idIntervencion)
          .collection('actividades')
          .get();

      return querySnapshot.docs
          .map((doc) => Actividad.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log('Error al obtener las actividades de la intervención: $e');
      throw Exception('Error al obtener las actividades de la intervención');
    }
  }
}
