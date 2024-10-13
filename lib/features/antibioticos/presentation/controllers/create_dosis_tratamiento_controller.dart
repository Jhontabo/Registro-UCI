import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/dosis_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/dto/create_dosis_tratamiento_dto.dart';
import 'package:registro_uci/features/antibioticos/data/providers/dosis_tratamiento_provider.dart';

class CreateDosisTratamientoController extends AsyncNotifier<void> {
  late final DosisTratamientoRepository _repository =
      ref.watch(dosisTratamientoRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> createDosisTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
    CreateDosisTratamientoDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.createDosisTratamiento(
          idIngreso,
          idTratamientoAntibiotico,
          idDiaTratamiento,
          dto,
        ));
    // Optionally invalidate relevant providers here
    ref.invalidate(dosisTratamientoProvider(DosisTratamientoParams(
      idIngreso: idIngreso,
      idTratamientoAntibiotico: idTratamientoAntibiotico,
      idDiaTratamiento: idDiaTratamiento,
    )));
  }
}

// Provider to expose the CreateDosisTratamientoController
final createDosisTratamientoControllerProvider =
    AsyncNotifierProvider<CreateDosisTratamientoController, void>(
  () => CreateDosisTratamientoController(),
);
