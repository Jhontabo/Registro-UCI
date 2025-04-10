import 'package:flutter/material.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';

class CambioPosicionDetailsDialog extends StatelessWidget {
  final CambioDePosicion cambio;

  const CambioPosicionDetailsDialog({
    super.key,
    required this.cambio,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Detalles del cambio de posición"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.airline_seat_recline_normal),
            title: const Text("Posición"),
            subtitle: Text(cambio.posicion),
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text("Hora"),
            subtitle: Text("${cambio.hora}:00"), // Formato de hora mejorado
          ),
          ListTile(
            leading: const Icon(Icons.format_list_numbered),
            title: const Text("Orden"),
            subtitle: Text(cambio.orden.toString()),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cerrar"),
        ),
      ],
    );
  }
}
