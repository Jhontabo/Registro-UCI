import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_tile.dart';
import 'package:registro_uci/pages/control_sedacion/control_sedacion_page.dart';

class ControlDeSedacionTile extends StatelessWidget {
  const ControlDeSedacionTile({
    super.key,
    required this.idIngreso,
    required this.idRegistro,
    required this.completed,
  });

  final String idIngreso;
  final String idRegistro;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return FormTile(
      completed: completed,
      title: "Control de Sedación",
      subtitle: "Evaluación y manejo de la sedación",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CambioPosicionPage(
                idIngreso: idIngreso, idRegistroDiario: idRegistro);
          },
        ));
      },
    );
  }
}
