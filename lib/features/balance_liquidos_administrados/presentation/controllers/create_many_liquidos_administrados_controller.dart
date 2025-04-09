import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/abstract_repositories/liquidos_administrados_repository.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/dto/create_liquido_administrado_dto.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/providers/liquidos_administrados_provider.dart';

class CreateManyLiquidosAdministradosController extends AsyncNotifier<void> {
  late final LiquidosAdministradosRepository _repository =
      ref.watch(liquidosAdministradosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> createManyLiquidosAdministrados(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    List<CreateLiquidoAdministradoDto> dtos,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _repository.createManyLiquidosAdministrados(
              idIngreso,
              idRegistroDiario,
              idBalanceLiquidos,
              dtos,
            ));
    ref.invalidate(liquidosAdministradosProvider(LiquidosAdministradosParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
      idBalanceLiquidos: idBalanceLiquidos,
    )));
  }
}

final createManyLiquidosAdministradosControllerProvider =
    AsyncNotifierProvider<CreateManyLiquidosAdministradosController, void>(
  () => CreateManyLiquidosAdministradosController(),
);
