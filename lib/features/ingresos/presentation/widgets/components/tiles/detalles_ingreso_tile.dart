import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/pages/ingreso/ingreso_details_page.dart';

class DetallesIngresoTile extends StatelessWidget {
  final String idIngreso;
  const DetallesIngresoTile({
    super.key,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.info_outline_rounded,
      title: "Detalles de Ingreso",
      subtitle: "Diagnóstico, Datos del paciente, familiar",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return IngresoDetailsPage(idIngreso: idIngreso);
            },
          ),
        );
      },
    );
  }
}
