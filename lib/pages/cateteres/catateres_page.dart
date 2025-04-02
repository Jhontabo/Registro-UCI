import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../features/cateteres/data/repositories/cateteres_repository.dart';
import 'package:registro_uci/features/cateteres/presentation/widgets/components/buttons/create_cateter_floating_button.dart';
import 'update_cateteres_page.dart';
import '../../features/cateteres/domain/models/cateter.dart';

class ListadoCateteresPage extends ConsumerStatefulWidget {
  final String idIngreso;

  const ListadoCateteresPage({super.key, required this.idIngreso});

  @override
  _ListadoCateteresPageState createState() => _ListadoCateteresPageState();
}

class _ListadoCateteresPageState extends ConsumerState<ListadoCateteresPage> {
  final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    final cateteresAsync =
        ref.watch(cateteresByIngresoProvider(widget.idIngreso));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catéteres"),
        centerTitle: true,
        elevation: 0,
      ),
      body: cateteresAsync.when(
        data: (cateteres) {
          if (cateteres.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medical_services,
                      size: 60, color: Colors.blue.shade300),
                  const SizedBox(height: 16),
                  Text(
                    "No hay catéteres registrados",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Presiona el botón + para agregar uno nuevo",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cateteres.length,
            itemBuilder: (context, index) {
              final cateter = cateteres[index];
              final fechaInsercion = cateter.fechaInsercion ?? DateTime.now();
              final fechaRetiro = cateter.fechaRetiro;
              final diasEnUso = fechaRetiro == null
                  ? DateTime.now().difference(fechaInsercion).inDays
                  : fechaRetiro.difference(fechaInsercion).inDays;
              final isActive = fechaRetiro == null;
              final tipoCateter = (cateter.tipo ?? '').trim().toLowerCase();
              final isPeriferico = tipoCateter.contains("periférico");

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cateter.tipo ?? 'Tipo no especificado',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? Colors.green.shade100
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              isActive ? 'ACTIVO' : 'RETIRADO',
                              style: TextStyle(
                                color: isActive
                                    ? Colors.green.shade800
                                    : Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        icon: Icons.calendar_today,
                        label: 'Inserción:',
                        value: dateFormat.format(fechaInsercion),
                      ),
                      const SizedBox(height: 8),
                      _buildDetailRow(
                        icon: Icons.location_on,
                        label: 'Sitio:',
                        value: cateter.sitio ?? 'No especificado',
                      ),
                      const SizedBox(height: 8),
                      _buildDetailRow(
                        icon: Icons.place,
                        label: 'Procedencia:',
                        value: cateter.lugarProcedencia ?? 'No especificado',
                      ),
                      if (fechaRetiro != null) ...[
                        const SizedBox(height: 8),
                        _buildDetailRow(
                          icon: Icons.calendar_today,
                          label: 'Retiro:',
                          value: dateFormat.format(fechaRetiro),
                        ),
                      ],
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '$diasEnUso días',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      diasEnUso > 7 ? Colors.red : Colors.green,
                                ),
                              ),
                              if (isPeriferico && diasEnUso >= 5) ...[
                                const SizedBox(width: 8),
                                const Icon(Icons.warning,
                                    color: Colors.orange, size: 24),
                              ],
                            ],
                          ),
                          Row(
                            children: [
                              _buildActionButton(
                                icon: Icons.edit,
                                color: Colors.blue,
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditCateterPage(
                                      idIngreso: widget.idIngreso,
                                      cateter: cateter,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              _buildActionButton(
                                icon: Icons.delete,
                                color: Colors.red,
                                onPressed: () =>
                                    _confirmDelete(context, cateter),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error al cargar los catéteres',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  err.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref
                      .invalidate(cateteresByIngresoProvider(widget.idIngreso)),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          CreateCateterFloatingButton(idIngreso: widget.idIngreso),
    );
  }

  Widget _buildDetailRow(
      {required IconData icon, required String label, required String value}) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
      required Color color,
      required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, Cateter cateter) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar eliminación"),
        content:
            const Text("¿Estás seguro de que deseas eliminar este catéter?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Eliminar", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ref
            .read(cateteresRepositoryProvider)
            .eliminarCateter(widget.idIngreso, cateter.id);
        ref.invalidate(cateteresByIngresoProvider(widget.idIngreso));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Catéter eliminado correctamente"),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al eliminar: $e"),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
