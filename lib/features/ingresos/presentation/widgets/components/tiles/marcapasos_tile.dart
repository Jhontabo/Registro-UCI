import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';

class MarcapasosTile extends StatelessWidget {
  const MarcapasosTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.monitor_heart_outlined,
      title: "Marcapasos",
      subtitle: "Registro de marcapasos del paciente",
      onTap: () {},
    );
  }
}
