import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/data/abstract_repositories/intervenciones_de_registro_repository.dart';
import 'package:registro_uci/features/intervenciones/data/providers/intervenciones_de_registro_provider.dart';

class AgregarIntervencionesARegistroController extends AsyncNotifier<void> {
  late final IntervencionesDeRegistroRepository _repository =
      ref.watch(intervencionesDeRegistroRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> agregarIntervencionesARegistro(
    String idIngreso,
    String idRegistro,
    List<String> idsIntervenciones,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.agregarIntervencionesARegistro(
        idIngreso,
        idRegistro,
        idsIntervenciones,
      ),
    );
    ref.invalidate(intervencionesDeRegistroProvider(
        ReporteParams(idIngreso: idIngreso, idRegistro: idRegistro)));
  }
}

final agregarIntervencionesARegistroControllerProvider =
    AsyncNotifierProvider<AgregarIntervencionesARegistroController, void>(
  () => AgregarIntervencionesARegistroController(),
);
