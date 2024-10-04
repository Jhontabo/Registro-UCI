import 'package:registro_uci/features/monitorias_hemodinamicas/data/dto/update_monitoria_hemodinamica_dto.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

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
}
