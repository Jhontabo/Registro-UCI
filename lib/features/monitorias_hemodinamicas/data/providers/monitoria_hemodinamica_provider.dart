import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

final monitoriaHemodinamicaProviderFamily =
    FutureProviderFamily<MonitoriaHemodinamica, MonitoriaHemodinamicaParams>(
  (ref, params) async {
    final repository = ref.read(monitoriasHemodinamicasRepositoryProvider);
    return await repository.getMonitoriaHemodinamica(
      params.idIngreso,
      params.idRegistroDiario,
      params.idMonitoria,
    );
  },
);

class MonitoriaHemodinamicaParams {
  final String idIngreso;
  final String idRegistroDiario;
  final String idMonitoria;

  MonitoriaHemodinamicaParams({
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.idMonitoria,
  });
}
