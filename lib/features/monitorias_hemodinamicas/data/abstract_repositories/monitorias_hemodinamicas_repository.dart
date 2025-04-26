import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

/// Repositorio abstracto para el manejo de monitorías hemodinámicas
///
/// Define las operaciones CRUD básicas y específicas para el manejo de
/// parámetros hemodinámicos de pacientes.
abstract class MonitoriaHemodinamicaRepository {
  /// Obtiene todas las monitorías hemodinámicas de un registro diario
  ///
  /// [idIngreso]: ID del ingreso hospitalario
  /// [idRegistroDiario]: ID del registro diario
  ///
  /// Retorna una lista de [MonitoriaHemodinamica] ordenadas por hora/orden
  Future<List<MonitoriaHemodinamica>> obtenerTodasLasMonitorias({
    required String idIngreso,
    required String idRegistroDiario,
  });

  /// Obtiene una monitoría hemodinámica específica por su ID
  ///
  /// [idIngreso]: ID del ingreso hospitalario
  /// [idRegistroDiario]: ID del registro diario
  /// [idMonitoria]: ID de la monitoría a obtener
  ///
  /// Retorna la [MonitoriaHemodinamica] o null si no existe
  Future<MonitoriaHemodinamica?> obtenerMonitoriaPorId({
    required String idIngreso,
    required String idRegistroDiario,
    required String idMonitoria,
  });

  /// Crea una nueva monitoría hemodinámica
  ///
  /// [idIngreso]: ID del ingreso hospitalario
  /// [idRegistroDiario]: ID del registro diario
  /// [hora]: Hora de registro (formato 24h)
  /// [pas]: Presión arterial sistólica (mmHg)
  /// [pad]: Presión arterial diastólica (mmHg)
  /// [pam]: Presión arterial media (mmHg). Si es null, se calcula automáticamente
  /// [fc]: Frecuencia cardíaca (latidos/min)
  /// [fr]: Frecuencia respiratoria (respiraciones/min)
  /// [t]: Temperatura (°C)
  /// [pvc]: Presión venosa central (mmHg)
  /// [rvc]: Resistencia vascular sistémica
  /// [fio2]: Fracción inspirada de oxígeno (%)
  /// [pia]: Presión intraabdominal (mmH2O)
  /// [ppa]: Presión de perfusión arterial (mmHg)
  /// [pic]: Presión intracraneal (mmHg)
  /// [ppc]: Presión de perfusión cerebral (mmHg)
  /// [glucometria]: Nivel de glucosa en sangre (mg/dL)
  /// [insulina]: Unidades de insulina administradas
  /// [saturacion]: Saturación de oxígeno (%)
  Future<void> crearMonitoria({
    required String idIngreso,
    required String idRegistroDiario,
    required int hora,
    int? pas,
    int? pad,
    int? pam,
    int? fc,
    int? fr,
    double? t,
    int? pvc,
    int? rvc,
    int? fio2,
    int? pia,
    int? ppa,
    int? pic,
    int? ppc,
    int? glucometria,
    int? insulina,
    int? saturacion,
  });

  /// Actualiza una monitoría hemodinámica existente
  ///
  /// [idIngreso]: ID del ingreso hospitalario
  /// [idRegistroDiario]: ID del registro diario
  /// [idMonitoria]: ID de la monitoría a actualizar
  /// [hora]: Nueva hora de registro
  /// [orden]: Nuevo orden (opcional)
  /// [pas]: Presión arterial sistólica (mmHg)
  /// [pad]: Presión arterial diastólica (mmHg)
  /// [pam]: Presión arterial media (mmHg). Si es null, se calcula automáticamente
  /// [fc]: Frecuencia cardíaca (latidos/min)
  /// [fr]: Frecuencia respiratoria (respiraciones/min)
  /// [t]: Temperatura (°C)
  /// [pvc]: Presión venosa central (mmHg)
  /// [rvc]: Resistencia vascular sistémica
  /// [fio2]: Fracción inspirada de oxígeno (%)
  /// [pia]: Presión intraabdominal (mmH2O)
  /// [ppa]: Presión de perfusión arterial (mmHg)
  /// [pic]: Presión intracraneal (mmHg)
  /// [ppc]: Presión de perfusión cerebral (mmHg)
  /// [glucometria]: Nivel de glucosa en sangre (mg/dL)
  /// [insulina]: Unidades de insulina administradas
  /// [saturacion]: Saturación de oxígeno (%)
  Future<void> actualizarMonitoria({
    required String idIngreso,
    required String idRegistroDiario,
    required String idMonitoria,
    required int hora,
    int? pas,
    int? pad,
    int? pam,
    int? fc,
    int? fr,
    double? t,
    int? pvc,
    int? rvc,
    int? fio2,
    int? pia,
    int? ppa,
    int? pic,
    int? ppc,
    int? glucometria,
    int? insulina,
    int? saturacion,
    int? orden,
  });

  /// Elimina una monitoría hemodinámica
  ///
  /// [idIngreso]: ID del ingreso hospitalario
  /// [idRegistroDiario]: ID del registro diario
  /// [idMonitoria]: ID de la monitoría a eliminar
  Future<void> eliminarMonitoria({
    required String idIngreso,
    required String idRegistroDiario,
    required String idMonitoria,
  });

  /// Reordena las monitorías según la lista de IDs proporcionada
  ///
  /// [idIngreso]: ID del ingreso hospitalario
  /// [idRegistroDiario]: ID del registro diario
  /// [idsEnOrden]: Lista de IDs en el nuevo orden deseado
  Future<void> reordenarMonitorias({
    required String idIngreso,
    required String idRegistroDiario,
    required List<String> idsEnOrden,
  });
}
