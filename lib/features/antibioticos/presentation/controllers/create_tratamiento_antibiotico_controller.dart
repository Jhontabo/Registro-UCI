import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/tratamientos_antibioticos_repository.dart';
import 'package:registro_uci/features/antibioticos/data/dto/create_tratamiento_antibiotico_dto.dart';
import 'package:registro_uci/features/antibioticos/data/providers/tratamientos_antibioticos_de_ingreso_provider.dart';

class CreateTratamientoAntibioticoController extends AsyncNotifier<void> {
  late final TratamientosAntibioticosRepository _repository =
      ref.watch(tratamientosAntibioticosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> createTratamientoAntibiotico(
    String idIngreso,
    CreateTratamientoAntibioticoDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _repository.createTratamientoAntibiotico(idIngreso, dto));
    ref.invalidate(tratamientosAntibioticosProvider(idIngreso));
  }
}

final createTratamientoAntibioticoControllerProvider =
    AsyncNotifierProvider<CreateTratamientoAntibioticoController, void>(
  () => CreateTratamientoAntibioticoController(),
);
