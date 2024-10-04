import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/pages/registros_diarios_page.dart';

class TerminarIngresoTile extends StatelessWidget {
  const TerminarIngresoTile({
    super.key,
    required this.idIngreso,
  });

  final String idIngreso;

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.cancel_outlined,
      title: "Terminar Ingreso",
      subtitle: "Usar esta opción cuando el paciente sale de la U.C.I",
      onTap: () {},
    );
  }
}
