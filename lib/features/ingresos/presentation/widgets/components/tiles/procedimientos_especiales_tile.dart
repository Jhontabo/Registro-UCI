import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import '../../../../../../pages/procedimientos_especiales/precedimientos_page.dart';

class ProcedimientosEspecialesTile extends StatelessWidget {
  const ProcedimientosEspecialesTile({
    super.key,
    required this.idIngreso,
  });

  final String idIngreso;

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.medical_information_outlined,
      title: "Procedimientos Especiales",
      subtitle: "Registro de procedimientos del paciente",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProcedimientosPage(idIngreso: idIngreso),
          ),
        );
      },
    );
  }
}
