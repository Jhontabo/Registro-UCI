import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

final monitoriasHemodinamicasProviderFamily = FutureProviderFamily<
    List<MonitoriaHemodinamica>, MonitoriasHemodinamicasParams>(
  (ref, params) async {
    final repository = ref.read(monitoriasHemodinamicasRepositoryProvider);
    return await repository.getAllMonitoriasHemodinamicas(
      params.idIngreso,
      params.idRegistroDiario,
    );
  },
);

class MonitoriasHemodinamicasParams {
  final String idIngreso;
  final String idRegistroDiario;

  MonitoriasHemodinamicasParams({
    required this.idIngreso,
    required this.idRegistroDiario,
  });
}
