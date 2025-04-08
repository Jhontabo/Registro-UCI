import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/balance_liquidos/data/providers/balances_de_liquidos_provider.dart';
import 'package:registro_uci/features/balance_liquidos/presentation/widgets/components/balance_de_liquidos_tile.dart';

class BalancesDeLiquidosList extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const BalancesDeLiquidosList(
      {super.key, required this.idIngreso, required this.idRegistroDiario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = BalancesDeLiquidosParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
    );

    final balances = ref.watch(balancesDeLiquidosProvider(params));
    return balances.when(
      data: (data) {
        return ListView.separated(
          itemCount: data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BalanceDeLiquidosTile(
            balance: data.elementAt(index),
            params: params,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: const EdgeInsets.all(15),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
