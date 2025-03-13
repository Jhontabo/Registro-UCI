import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../dto/create_procedimiento_dto.dart';
import '../dto/update_procedimiento_dto.dart';
import '../../domain/models/procedimientos_especiales.dart';
import '../abstract_repositories/procedimientos_repository.dart';

class FirebaseProcedimientosRepository implements ProcedimientosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Usamos un Stream para que se actualice en tiempo real
  @override
  Stream<List<ProcedimientoEspecial>> getProcedimientosDeRegistro(
      String idIngreso) {
    return _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('procedimientosEspeciales')
        .snapshots() // Escucha los cambios en tiempo real
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => ProcedimientoEspecial.fromJson(doc.data(), id: doc.id))
          .toList();
    });
  }

  @override
  Future<void> addProcedimientoToRegistro(
      String idIngreso, CreateProcedimientoDto dto) async {
    try {
      await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('procedimientosEspeciales')
          .add(dto.toJson());
    } catch (e) {
      log('Error al agregar el procedimiento: $e');
      throw Exception('Error al agregar el procedimiento');
    }
  }

  @override
  Future<void> updateProcedimientoDeRegistro(String idIngreso,
      String idProcedimiento, UpdateProcedimientoDto dto) async {
    try {
      final docRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('procedimientosEspeciales')
          .doc(idProcedimiento);

      await docRef.update(dto.toJson());
    } catch (e) {
      log('Error al actualizar el procedimiento: $e');
      throw Exception('Error al actualizar el procedimiento');
    }
  }

  @override
  Future<void> deleteProcedimientoDeRegistro(
      String idIngreso, String idProcedimiento) async {
    try {
      final docRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('procedimientosEspeciales')
          .doc(idProcedimiento);

      await docRef.delete();
    } catch (e) {
      log('Error al eliminar el procedimiento: $e');
      throw Exception('Error al eliminar el procedimiento');
    }
  }

  // Método para editar el nombre del procedimiento
  Future<void> editProcedimientoNombre(
    String idIngreso,
    String idProcedimiento,
    String nuevoNombre,
  ) async {
    try {
      final docRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('procedimientosEspeciales')
          .doc(idProcedimiento);

      // Solo actualizamos el nombre
      await docRef.update({
        'nombreProcedimiento': nuevoNombre,
      });
    } catch (e) {
      log('Error al editar el nombre del procedimiento: $e');
      throw Exception('Error al editar el nombre del procedimiento');
    }
  }

  // Método para actualizar el estado del procedimiento
  Future<void> updateProcedimientoEstado(
    String idIngreso,
    String idProcedimiento,
    String nuevoEstado,
  ) async {
    try {
      final docRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('procedimientosEspeciales')
          .doc(idProcedimiento);

      // Actualizamos solo el estado
      await docRef.update({
        'estado': nuevoEstado,
      });
    } catch (e) {
      log('Error al actualizar el estado del procedimiento: $e');
      throw Exception('Error al actualizar el estado del procedimiento');
    }
  }
}
