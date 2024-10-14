import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/dias_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/dto/update_dia_tratamiento_dto.dart';
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

  @override
  Future<void> updateDiaTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
    UpdateDiaTratamientoDto dto,
  ) async {
    try {
      final diaTratamientoRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico)
          .collection('diasTratamiento')
          .doc(idDiaTratamiento);

      // Update the diaTratamiento document with the values from the DTO
      await diaTratamientoRef.update(dto);
    } catch (e) {
      log('Error al actualizar el día de tratamiento: $e');
      throw Exception('Error al actualizar el día de tratamiento');
    }
  }

  @override
  Future<void> refreshDiasTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
  ) async {
    try {
      final tratamientoRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico);

      // Get the tratamientoAntibiotico document to read frecuenciaEn24h and cantidad
      final tratamientoSnapshot = await tratamientoRef.get();
      if (!tratamientoSnapshot.exists) {
        throw Exception('Tratamiento antibiótico no encontrado');
      }

      // Extract frecuenciaEn24h and cantidad
      final tratamientoData = tratamientoSnapshot.data()!;
      final int frecuenciaEn24h = tratamientoData['frecuenciaEn24h'];
      final int cantidad = tratamientoData['cantidad'];

      final int expectedCantidad = frecuenciaEn24h * cantidad;

      // Get all diasTratamiento
      final diasTratamientoSnapshot =
          await tratamientoRef.collection('diasTratamiento').get();

      final batch = _firestore.batch();

      for (var diaDoc in diasTratamientoSnapshot.docs) {
        final diaTratamientoRef = diaDoc.reference;

        // Get all dosis for the current diaTratamiento
        final dosisSnapshot = await diaTratamientoRef.collection('dosis').get();

        // Calculate actualCantidad by summing the 'cantidad' field of each dosis
        int actualCantidad = dosisSnapshot.docs.fold<int>(0, (suma, dosisDoc) {
          return suma + (dosisDoc.data()['cantidad'] as int);
        });

        // Compare actualCantidad with expectedCantidad and update 'valido'
        bool isValid = actualCantidad == expectedCantidad;

        // Update 'valido' field in diaTratamiento
        batch.update(diaTratamientoRef, {
          'valido': isValid,
        });
      }

      // Commit the batch update
      await batch.commit();
      log('Dias de tratamiento actualizados exitosamente');
    } catch (e) {
      log('Error al refrescar los días de tratamiento: $e');
      throw Exception('Error al refrescar los días de tratamiento');
    }
  }
}
