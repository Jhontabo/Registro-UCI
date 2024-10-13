import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';

final intervencionesDeRegistroProvider =
    FutureProvider.family<List<Intervencion>, ReporteParams>(
        (ref, params) async {
  return await ref
      .watch(intervencionesDeRegistroRepositoryProvider)
      .getIntervencionesDeRegistro(
        params.idIngreso,
        params.idRegistro,
      );
});
