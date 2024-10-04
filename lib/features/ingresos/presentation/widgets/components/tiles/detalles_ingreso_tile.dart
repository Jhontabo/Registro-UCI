import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/features/ingresos/data/providers/ingreso_by_id_provider.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';
import 'package:registro_uci/pages/ingreso_details_page.dart';

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
