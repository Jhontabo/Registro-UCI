import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/necesidades/data/abstract_repositories/necesidades_repository.dart';
import 'package:registro_uci/features/necesidades/data/dto/update_necesidad_dto.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';

class UpdateNecesidadDeRegistroController extends AsyncNotifier<void> {
  late final NecesidadesRepository _repository =
      ref.watch(necesidadesRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updateNecesidadDeRegistro(
    String idIngreso,
    String idRegistro,
    String idNecesidad,
    UpdateNecesidadDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.updateNecesidadDeRegistro(
        idIngreso, idRegistro, idNecesidad, dto));
    ref.invalidate(
      necesidadesDeRegistroProvider(NecesidadesParams(
        idIngreso: idIngreso,
        idRegistro: idRegistro,
      )),
    );
  }
}

final updateNecesidadDeRegistroControllerProvider =
    AsyncNotifierProvider<UpdateNecesidadDeRegistroController, void>(
  () => UpdateNecesidadDeRegistroController(),
);
