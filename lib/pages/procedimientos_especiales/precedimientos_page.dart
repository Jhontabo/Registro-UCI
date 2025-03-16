import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/procedimientos_especiales/data/providers/procedimiento_provider.dart';
import '../../features/procedimientos_especiales/domain/models/procedimientos_especiales.dart';

class ProcedimientosPage extends ConsumerWidget {
  final String idIngreso;

  const ProcedimientosPage({
    super.key,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final procedimientosAsync =
        ref.watch(procedimientoStreamProvider(idIngreso));

    return Scaffold(
      appBar: AppBar(title: const Text("Procedimientos Especiales")),
      body: procedimientosAsync.when(
        data: (procedimientos) => procedimientos.isEmpty
            ? const Center(child: Text("No hay procedimientos disponibles"))
            : ListView.builder(
                itemCount: procedimientos.length,
                itemBuilder: (context, index) {
                  final procedimiento = procedimientos[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(procedimiento.nombreProcedimiento),
                      subtitle: _buildEstadoText(procedimiento.estado),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _editarNombre(context, ref, procedimiento);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _mostrarConfirmacionEliminar(
                                  context, ref, procedimiento);
                            },
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.update, color: Colors.orange),
                            onPressed: () {
                              _actualizarEstado(context, ref, procedimiento);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text("Error: $error")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarDialogoAgregar(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Función que asigna color al estado
  // Función que asigna color a las letras del estado y agrega emojis
  Widget _buildEstadoText(String estado) {
    Color estadoColor;
    String emoji;

    switch (estado) {
      case 'Pendiente':
        estadoColor = Colors.orange; // Amarillo para pendiente
        emoji = '⏳'; // Emoji de reloj de arena
        break;
      case 'Realizado':
        estadoColor = Colors.green; // Verde para realizado
        emoji = '✅'; // Emoji de check
        break;
      case 'Reportado':
        estadoColor = Colors.blue; // Azul para reportado
        emoji = '📄❗'; // Emoji de documento con exclamación
        break;
      default:
        estadoColor = Colors.grey; // Color predeterminado en caso de error
        emoji = '❓'; // Emoji de pregunta
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$emoji $estado',
          style: TextStyle(
            color: estadoColor, // Solo el color de las letras
            fontWeight: FontWeight.bold, // Negrita para las letras
          ),
        ),
      ],
    );
  }

  void _mostrarDialogoAgregar(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Agregar Procedimiento"),
        content: TextField(
          controller: controller,
          decoration:
              const InputDecoration(labelText: "Nombre del Procedimiento"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar")),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref
                    .read(procedimientoActionProvider)
                    .addProcedimiento(idIngreso, controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text("Agregar"),
          ),
        ],
      ),
    );
  }

  void _editarNombre(BuildContext context, WidgetRef ref,
      ProcedimientoEspecial procedimiento) {
    final TextEditingController controller =
        TextEditingController(text: procedimiento.nombreProcedimiento);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Editar Nombre del Procedimiento"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: "Nuevo Nombre"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar")),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref.read(procedimientoActionProvider).editProcedimientoNombre(
                      idIngreso,
                      procedimiento.idProcedimiento,
                      controller.text,
                    );
                Navigator.pop(context);
              }
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }

  void _mostrarConfirmacionEliminar(BuildContext context, WidgetRef ref,
      ProcedimientoEspecial procedimiento) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar Eliminación"),
        content: const Text(
            "¿Estás seguro de que deseas eliminar este procedimiento?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              ref.read(procedimientoActionProvider).deleteProcedimiento(
                    idIngreso,
                    procedimiento.idProcedimiento,
                  );
              Navigator.pop(context);
            },
            child: const Text("Eliminar"),
          ),
        ],
      ),
    );
  }

  void _actualizarEstado(BuildContext context, WidgetRef ref,
      ProcedimientoEspecial procedimiento) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Actualizar Estado del Procedimiento"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Pendiente"),
              onTap: () {
                ref.read(procedimientoActionProvider).updateProcedimientoEstado(
                      idIngreso,
                      procedimiento.idProcedimiento,
                      "Pendiente",
                    );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Realizado"),
              onTap: () {
                ref.read(procedimientoActionProvider).updateProcedimientoEstado(
                      idIngreso,
                      procedimiento.idProcedimiento,
                      "Realizado",
                    );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Reportado"),
              onTap: () {
                ref.read(procedimientoActionProvider).updateProcedimientoEstado(
                      idIngreso,
                      procedimiento.idProcedimiento,
                      "Reportado",
                    );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
