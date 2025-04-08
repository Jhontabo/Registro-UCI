import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/sondas/presentation/widgets/components/create_sonda_floating_button.dart';
import '../../features/sondas/data/providers/sonda_provider.dart';

import '../sondas/update_sondas_page.dart';

class SondasPage extends ConsumerWidget {
  final String idIngreso;

  const SondasPage({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sondasAsync = ref.watch(sondasProvider(idIngreso));
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Sondas'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: sondasAsync.when(
          data: (sondas) {
            if (sondas.isEmpty) {
              return const _NoSondasWidget();
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sondas.length,
              itemBuilder: (context, index) {
                final sonda = sondas[index];
                final fechaColocacion = sonda.fechaColocacion;
                final fechaRetiro = sonda.fechaRetiro;
                final diasEnUso = fechaRetiro == null
                    ? DateTime.now().difference(fechaColocacion).inDays
                    : fechaRetiro.difference(fechaColocacion).inDays;
                final isActive = fechaRetiro == null;

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
                        Text(
                          sonda.tipo,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Colocada el: ${dateFormat.format(fechaColocacion.toLocal())}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Días en uso: $diasEnUso días',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        if (fechaRetiro != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Retirada el: ${dateFormat.format(fechaRetiro.toLocal())}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                isActive ? 'ACTIVA' : 'RETIRADA',
                                style: TextStyle(
                                  color: isActive
                                      ? Colors.green.shade800
                                      : Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateSondasPage(
                                          sonda: sonda,
                                          idIngreso: idIngreso,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () async {
                                    final confirm = await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Eliminar Sonda"),
                                        content: const Text(
                                            "¿Estás seguro de que deseas eliminar esta sonda?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, false),
                                            child: const Text("Cancelar"),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, true),
                                            child: const Text("Eliminar",
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                        ],
                                      ),
                                    );

                                    if (confirm == true) {
                                      try {
                                        await ref
                                            .read(sondaRepositoryProvider)
                                            .deleteSonda(sonda.id, idIngreso);
                                        ref.invalidate(sondasProvider);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "Sonda eliminada correctamente")),
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  "Error al eliminar: $e")),
                                        );
                                      }
                                    }
                                  },
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
            child: CircularProgressIndicator(),
          ),
          error: (error, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Error al cargar las sondas:\n$error',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: CreateSondaFloatingButton(idIngreso: idIngreso),
    );
  }
}

class _NoSondasWidget extends StatelessWidget {
  const _NoSondasWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 60, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            "No hay sondas registradas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Presiona el botón + para agregar una nueva sonda",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
