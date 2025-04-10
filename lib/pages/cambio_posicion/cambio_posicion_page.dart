import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/features/control_cambio_posicion/presentation/widgets/cambio_posicion_list.dart';
import 'package:registro_uci/pages/cambio_posicion/CambiosCard.dart';

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
              child: Text("Cambio de Posición"),
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
          CambioPosicionCard(
            idIngreso: idIngreso,
            idRegistroDiario: idRegistroDiario,
          ),
          CambioPosicionList(
            idIngreso: idIngreso,
            idRegistroDiario: idRegistroDiario,
          ),
        ],
      ),
    );
  }
}
