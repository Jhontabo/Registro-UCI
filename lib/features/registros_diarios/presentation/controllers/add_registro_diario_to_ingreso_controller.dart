import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/registros_diarios/data/abstract_repositories/registros_diarios_repository.dart';
import 'package:registro_uci/features/registros_diarios/data/dto/create_registro_diario_dto.dart';
import 'package:registro_uci/features/registros_diarios/data/providers/registros_diarios_de_ingreso_provider.dart';

class AddRegistroDiarioToIngresoController extends AsyncNotifier<void> {
  late final IRegistrosDiariosRepository _repository =
      ref.watch(registrosDiariosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> addRegistroDiarioToIngreso(
    String idIngreso,
    CreateRegistroDiarioDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _repository.addRegistroDiarioToIngreso(idIngreso, dto));
    ref.invalidate(
      registrosDiariosDeIngresoProvider(idIngreso),
    );
  }
}

final addRegistroDiarioToIngresoControllerProvider =
    AsyncNotifierProvider<AddRegistroDiarioToIngresoController, void>(
  () => AddRegistroDiarioToIngresoController(),
);
