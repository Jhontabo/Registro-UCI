import 'package:registro_uci/features/control_sedacion/domain/models/control_sedacion.dart';

abstract class ControlSedacionRepository {
  /// Obtiene todos los controles de sedación registrados
  Future<List<ControlSedacion>> getControlesSedacion(
    String idIngreso,
    String idRegistroDiario,
  );

  /// Obtiene un control de sedación específico por su ID
  Future<ControlSedacion?> getControlSedacionById(
    String idIngreso,
    String idRegistroDiario,
    String idControlSedacion,
  );

  /// Obtiene el último control de sedación registrado
  Future<ControlSedacion?> getUltimoControlSedacion(
    String idIngreso,
    String idRegistroDiario,
  );

  /// Guarda un nuevo control de sedación
  Future<void> guardarControlSedacion(
    String idIngreso,
    String idRegistroDiario,
    int hora,
    String observacion,
    int rass,
  );

  /// Actualiza un control de sedación existente
  Future<void> actualizarControlSedacion(
    String idIngreso,
    String idRegistroDiario,
    String idControlSedacion,
    int hora,
    String observacion,
    int rass, {
    int? orden,
  });

  /// Elimina un control de sedación
  Future<void> eliminarControlSedacion(
    String idIngreso,
    String idRegistroDiario,
    String idControlSedacion,
  );

  /// Obtiene un resumen de los valores RASS registrados
  Future<Map<String, int>> getResumenRASS(
    String idIngreso,
    String idRegistroDiario,
  );

  /// Reordena los controles de sedación según la lista de IDs proporcionada
  Future<void> reordenarControlesSedacion(
    String idIngreso,
    String idRegistroDiario,
    List<String> idsEnOrden,
  );
}
