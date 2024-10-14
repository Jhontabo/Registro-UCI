import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/tratamientos_antibioticos_repository.dart';
import 'package:registro_uci/features/antibioticos/data/dto/update_tratamiento_antibiotico_dto.dart';
import 'package:registro_uci/features/antibioticos/data/providers/tratamiento_antibiotico_provider.dart';
import 'package:registro_uci/features/antibioticos/data/providers/tratamientos_antibioticos_de_ingreso_provider.dart';

class UpdateTratamientoAntibioticoController extends AsyncNotifier<void> {
  late final TratamientosAntibioticosRepository _repository =
      ref.watch(tratamientosAntibioticosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updateTratamientoAntibiotico(
    String idIngreso,
    String idTratamientoAntibiotico,
    UpdateTratamientoAntibioticoDto dto,
  ) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _repository.updateTratamientoAntibiotico(
              idIngreso,
              idTratamientoAntibiotico,
              dto,
            ));
    ref.invalidate(
      tratamientoAntibioticoProvider(
        TratamientoAntibioticoParams(
            idIngreso: idIngreso,
            idTratamientoAntibiotico: idTratamientoAntibiotico),
      ),
    );

    ref.invalidate(tratamientosAntibioticosProvider(idIngreso));
  }
}

final updateTratamientoAntibioticoControllerProvider =
    AsyncNotifierProvider<UpdateTratamientoAntibioticoController, void>(
  () => UpdateTratamientoAntibioticoController(),
);
