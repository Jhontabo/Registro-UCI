import '../dto/create_procedimiento_dto.dart';
import '../dto/update_procedimiento_dto.dart';
import '../../domain/models/procedimientos_especiales.dart';

abstract class ProcedimientosRepository {
  // Cambiar a Stream para obtener los procedimientos en tiempo real
  Stream<List<ProcedimientoEspecial>> getProcedimientosDeRegistro(
    String idIngreso,
  );

  Future<void> addProcedimientoToRegistro(
    String idIngreso,
    CreateProcedimientoDto dto,
  );

  Future<void> updateProcedimientoDeRegistro(
    String idIngreso,
    String idProcedimiento,
    UpdateProcedimientoDto dto,
  );

  Future<void> deleteProcedimientoDeRegistro(
    String idIngreso,
    String idProcedimiento,
  );

  // Métodos adicionales para actualizar nombre y estado
  Future<void> editProcedimientoNombre(
    String idIngreso,
    String idProcedimiento,
    String nuevoNombre,
  );

  Future<void> updateProcedimientoEstado(
    String idIngreso,
    String idProcedimiento,
    String nuevoEstado,
  );
}
