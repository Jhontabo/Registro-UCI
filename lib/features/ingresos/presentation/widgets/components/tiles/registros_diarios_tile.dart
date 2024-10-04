import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/pages/registros_diarios_page.dart';

class RegistrosDiariosTile extends StatelessWidget {
  const RegistrosDiariosTile({
    super.key,
    required this.idIngreso,
  });

  final String idIngreso;

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.list_alt_outlined,
      title: "Registros Diarios",
      subtitle: "Necesidades, Tratamientos, Monitorías hemodinámicas",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RegistrosDiariosPage(idIngreso: idIngreso),
          ),
        );
      },
    );
  }
}
