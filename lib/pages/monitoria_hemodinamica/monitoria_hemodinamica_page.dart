import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/bed_widget.dart';

import 'package:registro_uci/pages/monitoria_hemodinamica/monitoria_hemodinamica_card.dart';

class MonitoriaHemodinamicaPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;
  const MonitoriaHemodinamicaPage({
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
              child: Text("Monitoria Hemodinámica"),
            ),
            const SizedBox(width: 10),
            BedProviderWidget(
              idIngreso: idIngreso,
              redirectable: true,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          MonitoriaHemodinamicaCard(
            idIngreso: idIngreso,
            idRegistroDiario: idRegistroDiario,
          ),
        ],
      ),
    );
  }
}
