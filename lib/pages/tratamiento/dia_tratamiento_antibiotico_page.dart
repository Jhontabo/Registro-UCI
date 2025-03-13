import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/dias_tratamiento_list.dart';

class DiasTratamientoAntibioticoPage extends StatelessWidget {
  final String idIngreso;
  final String idTratamientoAntibiotico;
  const DiasTratamientoAntibioticoPage(
      {super.key,
      required this.idIngreso,
      required this.idTratamientoAntibiotico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text("Dias de tratamiento"),
            ),
            const SizedBox(width: 10),
            BedProviderWidget(
              idIngreso: idIngreso,
              redirectable: true,
            ),
          ],
        ),
      ),
      body: DiasTratamientoList(
        idIngreso: idIngreso,
        idTratamientoAntibiotico: idTratamientoAntibiotico,
      ),
    );
  }
}
