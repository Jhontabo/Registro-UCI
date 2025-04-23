import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/bed_widget.dart';

import 'package:registro_uci/pages/control_sedacion/control_sadacion_card.dart';

class CambioPosicionPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;
  const CambioPosicionPage({
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
              child: Text("Control sedacion"),
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
          ControlSedacionCard(
            idIngreso: idIngreso,
            idRegistroDiario: idRegistroDiario,
          ),
        ],
      ),
    );
  }
}
