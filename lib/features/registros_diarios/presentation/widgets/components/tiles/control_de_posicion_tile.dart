import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_tile.dart';

class ControlDePosicionTile extends StatelessWidget {
  const ControlDePosicionTile({
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
      title: "Control de Posición",
      subtitle: "Registro de cambios posturales y manejo de posición",
      onTap: () {
        // Add navigation logic here
      },
    );
  }
}
