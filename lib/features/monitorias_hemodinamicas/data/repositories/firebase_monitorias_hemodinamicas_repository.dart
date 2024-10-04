import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/common/constants/firebase_collection_names.dart';
import 'dart:developer';

import 'package:registro_uci/features/monitorias_hemodinamicas/data/abstract_repositories/monitorias_hemodinamicas_repository.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/dto/update_monitoria_hemodinamica_dto.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

class FirebaseMonitoriasHemodinamicasRepository
    implements IMonitoriasHemodinamicasRepository {
  FirebaseMonitoriasHemodinamicasRepository();

  @override
  Future<void> updateMonitoriaHemodinamica(
      String idIngreso,
      String idRegistroDiario,
      String idMonitoria,
      UpdateMonitoriaHemodinamicaDto dto) async {
    try {
      // Reference to the specific monitoria document in Firestore
      final docRef = FirebaseFirestore.instance
          .collection(
            FirebaseCollectionNames.ingresos,
          ) // Main collection
          .doc(idIngreso) // Specific ingreso document
          .collection(
            FirebaseCollectionNames.registrosDiarios,
          ) // Subcollection of registrosDiarios
          .doc(idRegistroDiario) // Specific registroDiario document
          .collection(
            FirebaseCollectionNames.monitoriasHemodinamicas,
          ) // Subcollection of monitoriasHemodinamicas
          .doc(
            idMonitoria,
          ); // The specific monitoria document (assuming idMonitoria is numeric and needs to be converted to string)

      // Update the monitoria with the fields from the DTO
      await docRef.update(dto);
    } catch (e) {
      log('Error updating monitoria hemodinamica: $e');
      throw Exception('Failed to update monitoria hemodinamica');
    }
  }

  @override
  Future<MonitoriaHemodinamica> getMonitoriaHemodinamica(
    String idIngreso,
    String idRegistroDiario,
    String idMonitoria,
  ) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('monitoriasHemodinamicas')
          .doc(idMonitoria)
          .get();

      if (!docSnapshot.exists) {
        throw Exception('MonitoriaHemodinamica not found');
      }

      return MonitoriaHemodinamica.fromJson(docSnapshot.data()!,
          id: docSnapshot.id);
    } catch (e) {
      throw Exception('Error retrieving MonitoriaHemodinamica: $e');
    }
  }

  @override
  Future<List<MonitoriaHemodinamica>> getAllMonitoriasHemodinamicas(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('monitoriasHemodinamicas')
          .get();

      return querySnapshot.docs
          .map((doc) => MonitoriaHemodinamica.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      throw Exception('Error retrieving Monitorias Hemodinamicas: $e');
    }
  }
}
