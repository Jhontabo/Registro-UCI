import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_tile.dart';
import 'package:registro_uci/pages/balance_liquidos/balances_de_liquidos_page.dart';

class ControlDeLiquidosTile extends StatelessWidget {
  const ControlDeLiquidosTile({
    super.key,
    required this.idIngreso,
    required this.idRegistro,
    required this.completed,
  });

  final String idIngreso;
  final String idRegistro;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return FormTile(
      completed: completed,
      title: "Control de Líquidos",
      subtitle: "Balance hídrico y manejo de líquidos",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return BalancesDeLiquidosPage(
                idIngreso: idIngreso, idRegistroDiario: idRegistro);
          },
        ));
      },
    );
  }
}
