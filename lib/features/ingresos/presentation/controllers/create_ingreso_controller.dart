import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/ingresos/data/abstract_repositories/ingresos_repository.dart';
import 'package:registro_uci/features/ingresos/data/dto/create_ingreso_dto.dart';
import 'package:registro_uci/features/ingresos/data/providers/ingresos_by_sala_provider.dart';

class CreateIngresoController extends AsyncNotifier<void> {
  late final IngresosRepository _repository =
      ref.watch(ingresosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> createIngreso(CreateIngresoDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.createIngreso(dto));
    ref.invalidate(ingresosBySalaProvider);
  }
}

final createIngresoControllerProvider =
    AsyncNotifierProvider<CreateIngresoController, void>(
  () => CreateIngresoController(),
);
