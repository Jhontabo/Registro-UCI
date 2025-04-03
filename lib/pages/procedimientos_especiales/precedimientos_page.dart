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
      appBar: AppBar(
        title: const Text("Procedimientos Especiales"),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade800,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 8),
        child: procedimientosAsync.when(
          data: (procedimientos) => procedimientos.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  itemCount: procedimientos.length,
                  itemBuilder: (context, index) {
                    final procedimiento = procedimientos[index];
                    return _buildProcedimientoCard(context, ref, procedimiento);
                  },
                ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 50, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  "Error al cargar los procedimientos",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$error",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarDialogoAgregar(context, ref),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medical_services_outlined,
              size: 60, color: Colors.blue.shade300),
          const SizedBox(height: 16),
          Text(
            "No hay procedimientos registrados",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Presiona el botón + para agregar uno",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcedimientoCard(
    BuildContext context,
    WidgetRef ref,
    ProcedimientoEspecial procedimiento,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _actualizarEstado(context, ref, procedimiento),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      procedimiento.nombreProcedimiento,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getEstadoColor(procedimiento.estado)
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getEstadoColor(procedimiento.estado),
                        width: 1,
                      ),
                    ),
                    child: _buildEstadoText(procedimiento.estado),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, size: 22),
                    color: Colors.blue.shade600,
                    onPressed: () => _editarNombre(context, ref, procedimiento),
                    tooltip: 'Editar nombre',
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, size: 22),
                    color: Colors.red.shade600,
                    onPressed: () => _mostrarConfirmacionEliminar(
                        context, ref, procedimiento),
                    tooltip: 'Eliminar',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getEstadoColor(String estado) {
    switch (estado) {
      case 'Pendiente':
        return Colors.orange;
      case 'Realizado':
        return Colors.green;
      case 'Reportado':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Widget _buildEstadoText(String estado) {
    final color = _getEstadoColor(estado);
    String emoji;

    switch (estado) {
      case 'Pendiente':
        emoji = '⏳';
        break;
      case 'Realizado':
        emoji = '✅';
        break;
      case 'Reportado':
        emoji = '📄❗';
        break;
      default:
        emoji = '❓';
    }

    return Text(
      '$emoji $estado',
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
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
          decoration: const InputDecoration(
            labelText: "Nombre del Procedimiento",
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
            ),
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

  void _editarNombre(
    BuildContext context,
    WidgetRef ref,
    ProcedimientoEspecial procedimiento,
  ) {
    final TextEditingController controller =
        TextEditingController(text: procedimiento.nombreProcedimiento);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Editar Nombre"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: "Nuevo Nombre",
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
            ),
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

  void _mostrarConfirmacionEliminar(
    BuildContext context,
    WidgetRef ref,
    ProcedimientoEspecial procedimiento,
  ) {
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
            ),
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

  void _actualizarEstado(
    BuildContext context,
    WidgetRef ref,
    ProcedimientoEspecial procedimiento,
  ) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Actualizar Estado",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            _buildEstadoOption(
              context,
              ref,
              procedimiento,
              "Pendiente",
              Colors.orange,
              Icons.access_time,
            ),
            _buildEstadoOption(
              context,
              ref,
              procedimiento,
              "Realizado",
              Colors.green,
              Icons.check_circle,
            ),
            _buildEstadoOption(
              context,
              ref,
              procedimiento,
              "Reportado",
              Colors.blue,
              Icons.description,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEstadoOption(
    BuildContext context,
    WidgetRef ref,
    ProcedimientoEspecial procedimiento,
    String estado,
    Color color,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        estado,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      onTap: () {
        ref.read(procedimientoActionProvider).updateProcedimientoEstado(
              idIngreso,
              procedimiento.idProcedimiento,
              estado,
            );
        Navigator.pop(context);
      },
    );
  }
}
