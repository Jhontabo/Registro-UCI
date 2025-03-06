import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart'; // ✅ Importación para formatear las fechas
import '../../../../domain/models/cateter.dart';
import '../../../../data/providers/cateteres_providers.dart';

class ListadoCateteresWidget extends ConsumerWidget {
  final String idIngreso;

  const ListadoCateteresWidget({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cateteres = ref.watch(cateteresByIngresoProvider(idIngreso));

    return cateteres.when(
      data: (data) {
        print("📡 Catéteres actualizados en tiempo real: ${data.length}");
        if (data.isEmpty) {
          return const Center(child: Text("No hay catéteres registrados."));
        }
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final cateter = data[index];

            return Card(
              child: ListTile(
                title: Text(cateter.tipo,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sitio: ${cateter.sitio}"),
                    Text(
                        "Fecha Inserción: ${DateFormat('yyyy-MM-dd').format(cateter.fechaInsercion)}"),
                    if (cateter.fechaRetiro != null)
                      Text(
                          "Fecha Retiro: ${DateFormat('yyyy-MM-dd').format(cateter.fechaRetiro!)}"),
                    Text("Lugar: ${cateter.lugarProcedencia}"),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // TODO: Navegar a la pantalla de edición del catéter
                        print("✏️ Editar catéter ${cateter.id}");
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await ref.read(eliminarCateterProvider((
                          idIngreso: idIngreso,
                          idCateter: cateter.id,
                        )).future);
                        print("🗑️ Catéter eliminado: ${cateter.id}");
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 50),
            const SizedBox(height: 10),
            const Text("Error al cargar los catéteres."),
            Text("$error", style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
