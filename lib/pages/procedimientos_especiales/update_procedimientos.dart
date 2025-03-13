import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/procedimientos_especiales/data/providers/procedimiento_provider.dart';
import '../../features/procedimientos_especiales/domain/models/procedimientos_especiales.dart';

class EditarProcedimientoPage extends ConsumerWidget {
  final String idIngreso;
  final String idProcedimiento;
  final String nombreProcedimiento;
  final String estado;

  const EditarProcedimientoPage({
    super.key,
    required this.idIngreso,
    required this.idProcedimiento,
    required this.nombreProcedimiento,
    required this.estado,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nombreController =
        TextEditingController(text: nombreProcedimiento);
    final TextEditingController estadoController =
        TextEditingController(text: estado);

    return Scaffold(
      appBar: AppBar(title: const Text("Editar Procedimiento")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nombreController,
              decoration:
                  const InputDecoration(labelText: "Nombre del Procedimiento"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: estadoController,
              decoration:
                  const InputDecoration(labelText: "Estado del Procedimiento"),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(procedimientoActionProvider)
                        .editProcedimientoNombre(
                          idIngreso,
                          idProcedimiento,
                          nombreController.text,
                        );
                    Navigator.pop(context);
                  },
                  child: const Text("Guardar Nombre"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(procedimientoActionProvider)
                        .updateProcedimientoEstado(
                          idIngreso,
                          idProcedimiento,
                          estadoController.text,
                        );
                    Navigator.pop(context);
                  },
                  child: const Text("Guardar Estado"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
