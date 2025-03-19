import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/sondas/presentation/widgets/components/create_sonda_floating_button.dart';
import '../../features/sondas/data/providers/sonda_provider.dart';
import '../../features/sondas/domain/models/sonda.dart';
import '../sondas/create_sondas_page.dart';
import '../sondas/update_sondas_page.dart';

class SondasPage extends ConsumerWidget {
  final String idIngreso; // ✅ Se añade el parámetro obligatorio

  const SondasPage({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sondasAsync = ref.watch(sondasProvider(idIngreso));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Sondas'),
      ),
      body: SafeArea(
        child: sondasAsync.when(
          data: (sondas) {
            if (sondas.isEmpty) {
              return const _NoSondasWidget();
            }
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: sondas.length,
              itemBuilder: (context, index) {
                final sonda = sondas[index];

                // Cálculo de los días en uso
                final fechaColocacion = sonda.fechaColocacion;
                final fechaRetiro = sonda.fechaRetiro;
                final diasEnUso = fechaRetiro == null
                    ? DateTime.now().difference(fechaColocacion).inDays
                    : fechaRetiro.difference(fechaColocacion).inDays;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(sonda.tipo,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      'Colocada el: ${fechaColocacion.toLocal()}\nDías en uso: $diasEnUso\n${fechaRetiro == null ? "Aun en uso" : "Retirada el: ${fechaRetiro.toLocal()}"}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Editar Sonda
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
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

                        // Eliminar Sonda
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
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
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );

                            if (confirm == true) {
                              try {
                                // Deshabilitar el botón mientras se elimina
                                await ref
                                    .read(sondaRepositoryProvider)
                                    .deleteSonda(sonda.id, idIngreso);
                                ref.invalidate(
                                    sondasProvider); // Refrescar la lista de sondas
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Sonda eliminada correctamente")),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Error al eliminar: $e")),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
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

/// Widget para mostrar cuando no hay sondas registradas
class _NoSondasWidget extends StatelessWidget {
  const _NoSondasWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_rounded, size: 60, color: Colors.orange),
          SizedBox(height: 10),
          Text(
            "No hay sondas registradas.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Presiona el botón + para agregar una nueva sonda.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
