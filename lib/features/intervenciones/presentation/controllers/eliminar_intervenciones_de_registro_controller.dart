import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/data/abstract_repositories/intervenciones_de_registro_repository.dart';
import 'package:registro_uci/features/intervenciones/data/providers/intervenciones_de_registro_provider.dart';

class EliminarIntervencionDeRegistroController extends AsyncNotifier<void> {
  late final IntervencionesDeRegistroRepository _repository =
      ref.watch(intervencionesDeRegistroRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> eliminarIntervencionDeRegistro(
    String idIngreso,
    String idRegistro,
    String idIntervencion,
  ) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _repository.eliminarIntervencionDeRegistro(
              idIngreso,
              idRegistro,
              idIntervencion,
            ));
    ref.invalidate(intervencionesDeRegistroProvider(
        ReporteParams(idIngreso: idIngreso, idRegistro: idRegistro)));
  }
}

final eliminarIntervencionDeRegistroControllerProvider =
    AsyncNotifierProvider<EliminarIntervencionDeRegistroController, void>(
  () => EliminarIntervencionDeRegistroController(),
);
