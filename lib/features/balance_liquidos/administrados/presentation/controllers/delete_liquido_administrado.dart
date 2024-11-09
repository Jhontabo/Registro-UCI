import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/balance_liquidos/administrados/data/abstract_repositories/liquidos_administrados_repository.dart';
import 'package:registro_uci/features/balance_liquidos/administrados/data/providers/liquidos_administrados_provider.dart';

class DeleteLiquidoAdministradoController extends AsyncNotifier<void> {
  late final LiquidosAdministradosRepository _repository =
      ref.watch(liquidosAdministradosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> deleteLiquidoAdministrado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    String idLiquidoAdministrado,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.deleteLiquidoAdministrado(
          idIngreso,
          idRegistroDiario,
          idBalanceLiquidos,
          idLiquidoAdministrado,
        ));

    ref.invalidate(liquidosAdministradosProvider(LiquidosAdministradosParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
      idBalanceLiquidos: idBalanceLiquidos,
    )));
  }
}

final deleteLiquidoAdministradoControllerProvider =
    AsyncNotifierProvider<DeleteLiquidoAdministradoController, void>(
  () => DeleteLiquidoAdministradoController(),
);
