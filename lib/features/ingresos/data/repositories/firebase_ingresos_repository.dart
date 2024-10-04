import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/common/constants/firebase_collection_names.dart';
import 'package:registro_uci/features/ingresos/data/abstract_repositories/ingresos_repository.dart';
import 'package:registro_uci/features/ingresos/data/dto/create_ingreso_dto.dart';
import 'package:registro_uci/features/ingresos/data/dto/update_ingreso_dto.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';
import 'package:registro_uci/features/ingresos/data/constants/strings.dart';

class FirebaseIngresosRepository implements IngresosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Ingreso>> getAllIngresos() async {
    try {
      final querySnapshot = await _firestore
          .collection(FirebaseCollectionNames.ingresos)
          .orderBy(
            Strings.fechaIngreso,
            descending: true,
          )
          .get();

      return querySnapshot.docs
          .map((doc) => Ingreso.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log(e.toString());
      throw Exception('Error al obtener los ingresos');
    }
  }

  @override
  Future<void> createIngreso(CreateIngresoDto dto) async {
    try {
      await _firestore.collection(FirebaseCollectionNames.ingresos).add(dto);
    } catch (e) {
      throw Exception('Error al crear el ingreso');
    }
  }

  @override
  Future<void> updateIngreso(String idIngreso, UpdateIngresoDto dto) async {
    try {
      final docRef = _firestore
          .collection(FirebaseCollectionNames.ingresos)
          .doc(idIngreso);

      await docRef.update(dto);
    } catch (e) {
      log('Error updating ingreso: $e');
      throw Exception('Error al actualizar el ingreso');
    }
  }

  @override
  Future<Ingreso?> getIngresoById(String idIngreso) async {
    try {
      final docRef = _firestore
          .collection(FirebaseCollectionNames.ingresos)
          .doc(idIngreso);

      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        return Ingreso.fromJson(docSnapshot.data()!, id: docSnapshot.id);
      } else {
        return null;
      }
    } catch (e) {
      log('Error retrieving ingreso: $e');
      throw Exception('Error al consultar el ingreso');
    }
  }

  @override
  Future<List<Ingreso>> getIngresosBySala(Sala sala) async {
    // Query Firestore for documents where the 'sala' field matches the provided Sala
    final querySnapshot = await _firestore
        .collection(FirebaseCollectionNames.ingresos) // Your collection name
        .where('sala', isEqualTo: sala.name) // Use the enum name as a string
        .get();

    // Map the Firestore documents to your Ingreso model
    return querySnapshot.docs
        .map((doc) => Ingreso.fromJson(doc.data(),
            id: doc.id)) // Assuming you have a fromJson method
        .toList();
  }
}
