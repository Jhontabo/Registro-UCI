import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_tile.dart';

class ControlDeRiesgosTile extends StatelessWidget {
  const ControlDeRiesgosTile({
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
      title: "Control de Riesgos",
      subtitle: "Evaluación y manejo de riesgos para el paciente",
      onTap: () {
        // Add navigation logic here
      },
    );
  }
}
