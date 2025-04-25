import 'package:registro_uci/features/monitorias_hemodinamicas/data/dto/create_monitoria_hemodinamica_dto.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/dto/update_monitoria_hemodinamica_dto.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

abstract class MonitoriasHemodinamicasRepository {
  Future<MonitoriaHemodinamica> getMonitoriaHemodinamica(
    String idIngreso,
    String idRegistroDiario,
    String idMonitoria,
  );

  Future<List<MonitoriaHemodinamica>> getAllMonitoriasHemodinamicas(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<void> createMonitoriaHemodinamica(
    String idIngreso,
    String idRegistroDiario,
    CreateMonitoriaHemodinamicaDto monitoria,
  );

  Future<void> deleteMonitoriaHemodinamica(
    String idIngreso,
    String idRegistroDiario,
    String idMonitoria,
  );

  Future<void> updateMonitoriaHemodinamica(
    String idIngreso,
    String idRegistroDiario,
    String idMonitoria,
    UpdateMonitoriaHemodinamicaDto monitoria,
  );

  Future<List<MonitoriaHemodinamica>> getMonitoriasPorHora({
    required String idIngreso,
    required String idRegistroDiario,
    required int hora,
  });
  Future<void> firmarMonitoria({
    required String idIngreso,
    required String idRegistroDiario,
    required String idMonitoria,
    required String firmadoPor,
    required DateTime fechaFirma,
  });

  Future<MonitoriaHemodinamica?> getUltimaMonitoria(
    String idIngreso,
    String idRegistroDiario,
  );
  Future<bool> existeMonitoriaParaHora(
    String idIngreso,
    String idRegistroDiario,
    int hora,
  );
}
