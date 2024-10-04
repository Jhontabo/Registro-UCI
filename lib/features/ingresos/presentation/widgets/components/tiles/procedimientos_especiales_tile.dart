import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';

class ProcedimientosEspecialesTile extends StatelessWidget {
  const ProcedimientosEspecialesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.medical_information_outlined,
      title: "Procedimientos especiales",
      subtitle: "Registro de procedimientos del paciente",
      onTap: () {},
    );
  }
}
