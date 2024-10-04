import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/common/constants/firebase_collection_names.dart';
import 'package:registro_uci/features/firmas/data/dto/create_firma_dto.dart';
import 'package:registro_uci/features/firmas/domain/models/firma.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/dto/create_monitoria_hemodinamica_dto.dart';
import 'package:registro_uci/features/registros_diarios/data/abstract_repositories/registros_diarios_repository.dart';
import 'package:registro_uci/features/registros_diarios/data/dto/create_registro_diario_dto.dart';
import 'package:registro_uci/features/registros_diarios/domain/models/registro_diario.dart';

class FirebaseRegistrosDiariosRepository
    implements IRegistrosDiariosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<RegistroDiario>> getRegistrosDiariosDeIngreso(
      String idIngreso) async {
    try {
      // Get the 'registrosDiarios' subcollection of the specific 'Ingreso'
      final querySnapshot = await _firestore
          .collection(FirebaseCollectionNames.ingresos)
          .doc(idIngreso)
          .collection(FirebaseCollectionNames.registrosDiarios)
          .get();

      // Map the Firestore documents to RegistroDiario models using fromJson
      return querySnapshot.docs
          .map((doc) => RegistroDiario.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch registros diarios');
    }
  }

  @override
  Future<RegistroDiario?> getRegistroDiario(
      String idIngreso, String idRegistro) async {
    try {
      final docRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistro);

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        return RegistroDiario.fromJson(docSnapshot.data()!, id: docSnapshot.id);
      } else {
        return null;
      }
    } catch (e) {
      log('Error al obtener el registro diario: $e');
      throw Exception('Error al obtener el registro diario');
    }
  }

  @override
  Future<void> addRegistroDiarioToIngreso(
      String idIngreso, CreateRegistroDiarioDto dto) async {
    try {
      await _firestore.runTransaction((transaction) async {
        final registrosDiariosRef = _firestore
            .collection(FirebaseCollectionNames.ingresos)
            .doc(idIngreso)
            .collection(FirebaseCollectionNames.registrosDiarios);

        final String fechaRegistroId =
            dto.fechaRegistro.toIso8601String().split('T')[0];

        final docRef = registrosDiariosRef.doc(fechaRegistroId);

        final existingRegistro = await transaction.get(docRef);

        if (existingRegistro.exists) {
          throw Exception(
              'Ya existe un registro diario para la fecha: $fechaRegistroId');
        }

        // Add the Registro Diario
        transaction.set(docRef, dto);

        // Create 24 Monitorias Hemodinamicas
        final monitorias = List.generate(
          24,
          (index) => CreateMonitoriaHemodinamicaDto(hora: index + 1),
        );

        final monitoriasRef =
            docRef.collection(FirebaseCollectionNames.monitoriasHemodinamicas);

        for (var monitoria in monitorias) {
          final monitoriaDocRef = monitoriasRef.doc('${monitoria.hora}');
          transaction.set(monitoriaDocRef, monitoria);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> firmarReporte(
    String idIngreso,
    String idRegistro,
    String tipoFirma,
    CreateFirmaDto firma,
  ) async {
    try {
      final docRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistro);

      await docRef.update({
        tipoFirma: firma, // Update the corresponding firma property
      });
    } catch (e) {
      log('Error al firmar el reporte: $e');
      throw Exception('Error al firmar el reporte');
    }
  }

  @override
  Future<Firma?> getFirma(
    String idIngreso,
    String idRegistro,
    String tipoFirma,
  ) async {
    try {
      final docRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistro);

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        final firmaData = docSnapshot.data()![tipoFirma];
        if (firmaData != null) {
          return Firma.fromJson(
              firmaData); // Assuming Firma has a fromJson method
        } else {
          return null; // Return null if the firmaData is not available
        }
      } else {
        throw Exception('Registro diario no encontrado');
      }
    } catch (e) {
      log('Error al obtener la firma: $e');
      throw Exception('Error al obtener la firma');
    }
  }
}
