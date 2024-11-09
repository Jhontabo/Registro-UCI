import 'package:flutter/material.dart';
import 'package:registro_uci/features/balance_liquidos/administrados/domain/models/liquido_administrado.dart';

class LiquidoAdministradoTile extends StatelessWidget {
  final LiquidoAdministrado liquido;
  final VoidCallback onDetailsTap;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  const LiquidoAdministradoTile({
    super.key,
    required this.liquido,
    required this.onDetailsTap,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: liquido.esTratamiento
            ? const Icon(Icons.medication, color: Colors.red)
            : const Icon(Icons.local_drink),
        title: Text(liquido.medicamento),
        subtitle: Text("${liquido.cantidad} ml - ${liquido.hora.hour}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.info), onPressed: onDetailsTap),
            IconButton(icon: const Icon(Icons.edit), onPressed: onEditTap),
            IconButton(icon: const Icon(Icons.delete), onPressed: onDeleteTap),
          ],
        ),
      ),
    );
  }
}
