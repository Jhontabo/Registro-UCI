import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/abstract_repositories/liquidos_administrados_repository.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/dto/create_liquido_administrado_dto.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/providers/liquidos_administrados_provider.dart';

class UpdateLiquidoAdministradoController extends AsyncNotifier<void> {
  late final LiquidosAdministradosRepository _repository =
      ref.watch(liquidosAdministradosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updateLiquidoAdministrado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    String idLiquidoAdministrado,
    CreateLiquidoAdministradoDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.updateLiquidoAdministrado(
          idIngreso,
          idRegistroDiario,
          idBalanceLiquidos,
          idLiquidoAdministrado,
          dto,
        ));

    ref.invalidate(liquidosAdministradosProvider(LiquidosAdministradosParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
      idBalanceLiquidos: idBalanceLiquidos,
    )));
  }
}

final updateLiquidoAdministradoControllerProvider =
    AsyncNotifierProvider<UpdateLiquidoAdministradoController, void>(
  () => UpdateLiquidoAdministradoController(),
);
