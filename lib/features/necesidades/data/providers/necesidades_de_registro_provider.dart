import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';

final necesidadesDeRegistroProvider =
    FutureProvider.family<List<Necesidad>, ReporteParams>((ref, params) async {
  return await ref
      .watch(necesidadesRepositoryProvider)
      .getNecesidadesDeRegistro(
        params.idIngreso,
        params.idRegistro,
      );
});
