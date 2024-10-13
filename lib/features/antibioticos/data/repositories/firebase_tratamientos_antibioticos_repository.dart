import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/tratamientos_antibioticos_repository.dart';
import 'package:registro_uci/features/antibioticos/data/dto/create_tratamiento_antibiotico_dto.dart';
import 'package:registro_uci/features/antibioticos/domain/models/tratamiento_antibiotico.dart';

class FirebaseTratamientosAntibioticosRepository
    implements TratamientosAntibioticosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createTratamientoAntibiotico(
    String idIngreso,
    CreateTratamientoAntibioticoDto dto,
  ) async {
    try {
      final ingresoRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos');

      final now = DateTime.now();
      DateTime currentInicio = dto.fechaInicio;
      int dayCounter = 1;

      // Run the transaction
      await _firestore.runTransaction((transaction) async {
        // Create the tratamientoAntibiotico document
        final tratamientoRef = ingresoRef.doc();
        transaction.set(
            tratamientoRef, dto); // Assuming dto has a toJson method

        // Generate diaTratamientos until current date
        while (currentInicio.add(const Duration(hours: 24)).isBefore(now)) {
          DateTime fin =
              currentInicio.add(const Duration(hours: 23, minutes: 59));

          // Create diaTratamiento document with numbered ID and day
          final diaTratamientoRef = tratamientoRef
              .collection('diasTratamiento')
              .doc(dayCounter.toString());
          transaction.set(diaTratamientoRef, {
            'inicio': currentInicio,
            'fin': fin,
            'dia': dayCounter,
            'valido': true // Add the day as an integer
          });

          // Generate dosis for each diaTratamiento
          final dosisInterval = Duration(
              hours: 24 ~/ dto.frecuenciaEn24h); // Divide 24h by frecuencia
          DateTime dosisHora = currentInicio;

          for (int i = 0; i < dto.frecuenciaEn24h; i++) {
            // Create dosis document within the transaction
            final dosisRef = diaTratamientoRef.collection('dosis').doc();
            transaction.set(dosisRef, {
              'hora': dosisHora,
              'cantidad': dto.cantidad,
              'dosis': '', // Placeholder, add necessary information
              'comentario': '', // Placeholder, add necessary information
            });

            // Move to next dosis time
            dosisHora = dosisHora.add(dosisInterval);
          }

          // Move to the next day for the next diaTratamiento
          currentInicio = currentInicio.add(const Duration(hours: 24));
          dayCounter++; // Increment the day counter
        }
      });
    } catch (e) {
      log('Error al crear tratamiento antibiótico: $e');
      throw Exception('Error al crear el tratamiento antibiótico');
    }
  }

  @override
  Future<List<TratamientoAntibiotico>> getTratamientosAntibioticosDeIngreso(
    String idIngreso,
  ) async {
    try {
      final querySnapshot = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .get();

      return querySnapshot.docs
          .map((doc) => TratamientoAntibiotico.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log('Error al obtener los tratamientos antibióticos: $e');
      throw Exception('Error al obtener los tratamientos antibióticos');
    }
  }

  @override
  Future<void> finalizarTratamientoAntibiotico(
    String idIngreso,
    String idTratamientoAntibiotico,
  ) async {
    try {
      final tratamientoRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico);

      // Set fechaFin to DateTime.now()
      await tratamientoRef.update({
        'fechaFin': DateTime.now(),
      });
    } catch (e) {
      log('Error al finalizar tratamiento antibiótico: $e');
      throw Exception('Error al finalizar el tratamiento antibiótico');
    }
  }

  @override
  Future<TratamientoAntibiotico> getTratamientoAntibiotico(
    String idIngreso,
    String idTratamientoAntibiotico,
  ) async {
    try {
      final tratamientoRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico);

      final tratamientoSnapshot = await tratamientoRef.get();

      if (!tratamientoSnapshot.exists) {
        throw Exception('TratamientoAntibiotico no encontrado');
      }

      return TratamientoAntibiotico.fromJson(tratamientoSnapshot.data()!,
          id: tratamientoSnapshot.id);
    } catch (e) {
      log('Error al obtener tratamiento antibiótico: $e');
      throw Exception('Error al obtener el tratamiento antibiótico');
    }
  }
}
