import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/common/components/lite_tile.dart';
import 'package:registro_uci/features/antibioticos/data/providers/dosis_tratamiento_provider.dart';
import 'package:registro_uci/features/antibioticos/data/providers/tratamiento_antibiotico_provider.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dia_tratamiento.dart';
import 'package:registro_uci/pages/dosis_tratamiento_page.dart';

class DiaTratamientoTile extends StatelessWidget {
  final DiaTratamiento diaTratamiento;
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const DiaTratamientoTile(
      {super.key,
      required this.diaTratamiento,
      required this.idIngreso,
      required this.idTratamientoAntibiotico});

  @override
  Widget build(BuildContext context) {
    // Define the date format you need
    final DateFormat dateFormat =
        DateFormat('d/MMM h:mm a'); // e.g., 12/Oct 2:00 am

    return LiteTile(
      title:
          '${dateFormat.format(diaTratamiento.inicio)} - ${dateFormat.format(diaTratamiento.fin)}',
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DosisTratamientoPage(
                dosisParams: DosisTratamientoParams(
                  idIngreso: idIngreso,
                  idTratamientoAntibiotico: idTratamientoAntibiotico,
                  idDiaTratamiento: diaTratamiento.idDiaTratamiento,
                ),
                tratamientoParams: TratamientoAntibioticoParams(
                  idIngreso: idIngreso,
                  idTratamientoAntibiotico: idTratamientoAntibiotico,
                ));
          },
        ));
      },
    );
  }
}
