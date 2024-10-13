import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/necesidades/data/abstract_repositories/necesidades_repository.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';

class DeleteNecesidadDeRegistroController extends AsyncNotifier<void> {
  late final NecesidadesRepository _repository =
      ref.watch(necesidadesRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> deleteNecesidadDeRegistro(
    String idIngreso,
    String idRegistro,
    String idNecesidad,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.deleteNecesidadDeRegistro(
          idIngreso,
          idRegistro,
          idNecesidad,
        ));
    ref.invalidate(
      necesidadesDeRegistroProvider(
        ReporteParams(idIngreso: idIngreso, idRegistro: idRegistro),
      ),
    );
  }
}

final deleteNecesidadDeRegistroControllerProvider =
    AsyncNotifierProvider<DeleteNecesidadDeRegistroController, void>(
  () => DeleteNecesidadDeRegistroController(),
);
