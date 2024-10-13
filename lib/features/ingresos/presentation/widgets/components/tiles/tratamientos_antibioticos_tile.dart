import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/pages/tratamientos_antibioticos_page.dart';

class TratamientosAntibioticosTile extends StatelessWidget {
  const TratamientosAntibioticosTile({
    super.key,
    required this.idIngreso,
  });
  final String idIngreso;

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.medication_liquid_sharp,
      title: "Antibioticos",
      subtitle: "Tratamientos con antibioticos",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return TratamientosAntibioticosPage(
              idIngreso: idIngreso,
            );
          },
        ));
      },
    );
  }
}
