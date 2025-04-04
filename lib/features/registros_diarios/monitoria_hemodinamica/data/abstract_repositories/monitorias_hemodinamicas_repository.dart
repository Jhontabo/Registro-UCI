// lib/features/registros_diarios/monitoria_hemodinamica/domain/repositories/monitorias_hemodinamicas_repository.dart
import 'package:registro_uci/features/registros_diarios/monitoria_hemodinamica/data/dto/update_monitoria_hemodinamica_dto.dart';
import 'package:registro_uci/features/registros_diarios/monitoria_hemodinamica/domain/models/monitoria_hemodinamica.dart';

abstract class IMonitoriasHemodinamicasRepository {
  Future<void> updateMonitoriaHemodinamica(
    String idIngreso,
    String idRegistroDiario,
    String idMonitoria,
    UpdateMonitoriaHemodinamicaDto dto,
  );

  Future<MonitoriaHemodinamica> getMonitoriaHemodinamica(
    String idIngreso,
    String idRegistroDiario,
    String idMonitoria,
  );

  Future<List<MonitoriaHemodinamica>> getAllMonitoriasHemodinamicas(
    String idIngreso,
    String idRegistroDiario,
  );

  // Métodos adicionales para el resumen
  Future<Map<String, dynamic>> getResumenHemodinamico(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<void> calcularResumen(
    String idIngreso,
    String idRegistroDiario,
    int rangoHoras,
  );
}
