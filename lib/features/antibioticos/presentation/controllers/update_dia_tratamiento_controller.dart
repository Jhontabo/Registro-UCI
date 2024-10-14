import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/dias_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/dto/update_dia_tratamiento_dto.dart';
import 'package:registro_uci/features/antibioticos/data/providers/dia_tratamiento_provider.dart';
import 'package:registro_uci/features/antibioticos/data/providers/dias_tratamiento_provider.dart';

class UpdateDiaTratamientoController extends AsyncNotifier<void> {
  late final DiasTratamientoRepository _repository =
      ref.watch(diasTratamientoRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updateDiaTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
    UpdateDiaTratamientoDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.updateDiaTratamiento(
          idIngreso,
          idTratamientoAntibiotico,
          idDiaTratamiento,
          dto,
        ));

    ref.invalidate(diasTratamientoProvider(DiasTratamientoParams(
      idIngreso: idIngreso,
      idTratamientoAntibiotico: idTratamientoAntibiotico,
    )));

    ref.invalidate(diaTratamientoProvider(DiaTratamientoParams(
      idIngreso: idIngreso,
      idTratamientoAntibiotico: idTratamientoAntibiotico,
      idDiaTratamiento: idDiaTratamiento,
    )));
  }
}

final updateDiaTratamientoControllerProvider =
    AsyncNotifierProvider<UpdateDiaTratamientoController, void>(
  () => UpdateDiaTratamientoController(),
);
