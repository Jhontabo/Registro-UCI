import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/pages/tratamiento/dia_tratamiento_antibiotico_page.dart';

class DiasTratamientoAntibioticoTile extends StatelessWidget {
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const DiasTratamientoAntibioticoTile({
    super.key,
    required this.idIngreso,
    required this.idTratamientoAntibiotico,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      title: 'Dias de tratamiento antibiotico',
      subtitle: 'Dosis administradas',
      iconData: Icons.water_drop_outlined,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DiasTratamientoAntibioticoPage(
                idIngreso: idIngreso,
                idTratamientoAntibiotico: idTratamientoAntibiotico);
          },
        ));
      },
    );
  }
}
