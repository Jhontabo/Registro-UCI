import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';

class CateteresTile extends StatelessWidget {
  const CateteresTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.vaccines_outlined,
      title: "Cateteres",
      subtitle: "Registro de cateteres del paciente",
      onTap: () {},
    );
  }
}
