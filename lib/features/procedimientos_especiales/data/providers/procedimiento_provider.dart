import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/firabase_procedimientos_especiales.dart';
import '../../domain/models/procedimientos_especiales.dart';
import '../../data/dto/create_procedimiento_dto.dart';
import '../../data/dto/update_procedimiento_dto.dart';

// Proveedor del repositorio de Firebase
final procedimientoRepositoryProvider =
    Provider<FirebaseProcedimientosRepository>((ref) {
  return FirebaseProcedimientosRepository();
});

// Proveedor para escuchar los procedimientos en tiempo real
final procedimientoStreamProvider =
    StreamProvider.family<List<ProcedimientoEspecial>, String>(
        (ref, idIngreso) {
  final repository = ref.watch(procedimientoRepositoryProvider);
  return repository.getProcedimientosDeRegistro(idIngreso);
});

// Proveedor para manejar las acciones (agregar, actualizar, eliminar)
final procedimientoActionProvider = Provider<ProcedimientoActions>((ref) {
  return ProcedimientoActions(ref.watch(procedimientoRepositoryProvider));
});

class ProcedimientoActions {
  final FirebaseProcedimientosRepository _repository;

  ProcedimientoActions(this._repository);

  Future<void> addProcedimiento(String idIngreso, String nombre) async {
    final nuevoProcedimiento = CreateProcedimientoDto(
      nombreProcedimiento: nombre,
      estado: "Pendiente",
    );
    await _repository.addProcedimientoToRegistro(idIngreso, nuevoProcedimiento);
  }

  Future<void> updateProcedimiento(
      String idIngreso, String idProcedimiento, String nuevoEstado) async {
    final updateDto = UpdateProcedimientoDto(estado: nuevoEstado);
    await _repository.updateProcedimientoDeRegistro(
        idIngreso, idProcedimiento, updateDto);
  }

  Future<void> deleteProcedimiento(
      String idIngreso, String idProcedimiento) async {
    await _repository.deleteProcedimientoDeRegistro(idIngreso, idProcedimiento);
  }

  Future<void> editProcedimientoNombre(
      String idIngreso, String idProcedimiento, String nuevoNombre) async {
    await _repository.editProcedimientoNombre(
        idIngreso, idProcedimiento, nuevoNombre);
  }

  Future<void> updateProcedimientoEstado(
      String idIngreso, String idProcedimiento, String nuevoEstado) async {
    await _repository.updateProcedimientoEstado(
        idIngreso, idProcedimiento, nuevoEstado);
  }
}
