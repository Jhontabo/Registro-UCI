import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_tile.dart';

class TratamientosTile extends StatelessWidget {
  const TratamientosTile({
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
      title: "Lista de Tratamientos",
      subtitle: "Tratamientos administrados y planificados",
      onTap: () {
        // Add navigation logic here
      },
    );
  }
}
