import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/balance_liquidos/domain/models/balance_de_liquidos.dart';

@immutable
class BalancesDeLiquidosParams {
  final String idIngreso;
  final String idRegistroDiario;

  const BalancesDeLiquidosParams({
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BalancesDeLiquidosParams &&
        other.idIngreso == idIngreso &&
        other.idRegistroDiario == idRegistroDiario;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idRegistroDiario);
}

final balancesDeLiquidosProvider =
    FutureProvider.family<List<BalanceDeLiquidos>, BalancesDeLiquidosParams>(
        (ref, params) async {
  final repository = ref.watch(
      balancesDeLiquidosRepositoryProvider); // Assuming a repository provider exists

  try {
    return await repository.getBalancesDeLiquidos(
      params.idIngreso,
      params.idRegistroDiario,
    );
  } catch (e) {
    throw Exception('Error al obtener balances de líquidos: $e');
  }
});
