import 'package:flutter/material.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_administrados/domain/models/liquido_administrado.dart';

class LiquidoAdministradoDetailsDialog extends StatelessWidget {
  final LiquidoAdministrado liquido;

  const LiquidoAdministradoDetailsDialog({super.key, required this.liquido});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Detalles del líquido"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.local_drink),
            title: const Text("Medicamento"),
            subtitle: Text(liquido.medicamento),
          ),
          ListTile(
            leading: const Icon(Icons.invert_colors),
            title: const Text("Cantidad"),
            subtitle: Text("${liquido.cantidad} ml"),
          ),
          if (liquido.comentario != null)
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text("Comentario"),
              subtitle: Text(liquido.comentario!),
            ),
          if (liquido.dosis != null)
            ListTile(
              leading: const Icon(Icons.bloodtype),
              title: const Text("Dosis"),
              subtitle: Text(liquido.dosis!),
            ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text("Hora"),
            subtitle: Text(liquido.hora.toString()),
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
