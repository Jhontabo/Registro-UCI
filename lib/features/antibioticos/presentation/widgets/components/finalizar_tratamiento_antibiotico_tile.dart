import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/confirm_finalizar_antibiotico_form.dart';

class FinalizarTratamientoAntibioticoTile extends StatelessWidget {
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const FinalizarTratamientoAntibioticoTile({
    super.key,
    required this.idIngreso,
    required this.idTratamientoAntibiotico,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      title: 'Finalizar tratamiento',
      subtitle: 'Desactivar tratamiento',
      iconData: Icons.cancel_outlined,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: ConfirmFinalizarAntibioticoForm(
                  idIngreso: idIngreso,
                  idTratamientoAntibiotico: idTratamientoAntibiotico),
            );
          },
        );
      },
    );
  }
}
