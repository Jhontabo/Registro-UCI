import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';

import 'package:registro_uci/features/balance_liquidos/administrados/domain/models/liquido_administrado.dart';

final liquidosAdministradosProvider = FutureProvider.family<
    List<LiquidoAdministrado>,
    LiquidosAdministradosParams>((ref, params) async {
  final repository = ref.watch(
      liquidosAdministradosRepositoryProvider); // Assuming a repository provider exists

  try {
    return await repository.getLiquidosAdministrados(
      params.idIngreso,
      params.idRegistroDiario,
      params.idBalanceLiquidos,
    );
  } catch (e) {
    throw Exception('Error al obtener líquidos administrados: $e');
  }
});

@immutable
class LiquidosAdministradosParams {
  final String idIngreso;
  final String idRegistroDiario;
  final String idBalanceLiquidos;

  const LiquidosAdministradosParams({
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.idBalanceLiquidos,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LiquidosAdministradosParams &&
        other.idIngreso == idIngreso &&
        other.idRegistroDiario == idRegistroDiario &&
        other.idBalanceLiquidos == idBalanceLiquidos;
  }

  @override
  int get hashCode =>
      Object.hash(idIngreso, idRegistroDiario, idBalanceLiquidos);
}
