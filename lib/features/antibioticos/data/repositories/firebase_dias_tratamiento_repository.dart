import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/dias_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dia_tratamiento.dart';

class FirebaseDiasTratamientoRepository implements DiasTratamientoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<DiaTratamiento>> getDiasTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
  ) async {
    try {
      final querySnapshot = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico)
          .collection('diasTratamiento')
          .get();

      return querySnapshot.docs
          .map((doc) => DiaTratamiento.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log('Error al obtener los días de tratamiento: $e');
      throw Exception('Error al obtener los días de tratamiento');
    }
  }

  @override
  Future<DiaTratamiento?> getDiaTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
  ) async {
    try {
      final diaTratamientoRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico)
          .collection('diasTratamiento')
          .doc(idDiaTratamiento);

      final diaTratamientoSnapshot = await diaTratamientoRef.get();

      if (diaTratamientoSnapshot.exists) {
        return DiaTratamiento.fromJson(diaTratamientoSnapshot.data()!,
            id: diaTratamientoSnapshot.id);
      } else {
        log('Día de tratamiento no encontrado');
        return null;
      }
    } catch (e) {
      log('Error al obtener el día de tratamiento: $e');
      return null;
    }
  }
}
