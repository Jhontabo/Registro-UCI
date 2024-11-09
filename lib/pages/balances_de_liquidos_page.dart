import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/features/balance_liquidos/presentation/widgets/balances_de_liquidos_list.dart';

class BalancesDeLiquidosPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;
  const BalancesDeLiquidosPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text("Balances de Liquidos"),
            ),
            const SizedBox(width: 10),
            BedProviderWidget(
              idIngreso: idIngreso,
              redirectable: true,
            ),
          ],
        ),
      ),
      body: BalancesDeLiquidosList(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      ),
    );
  }
}
