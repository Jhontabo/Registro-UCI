import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/cateteres/data/repositories/cateteres_repository.dart'; // ✅ Importación correcta
import 'package:registro_uci/features/cateteres/presentation/widgets/components/buttons/create_cateter_floating_button.dart';
import '../pages/update_cateteres_page.dart';

class ListadoCateteresPage extends ConsumerWidget {
  final String idIngreso;

  const ListadoCateteresPage({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cateteresAsync = ref.watch(cateteresByIngresoProvider(idIngreso));

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Catéteres")),
      body: cateteresAsync.when(
        data: (cateteres) {
          if (cateteres.isEmpty) {
            return const Center(
              child: Text("No hay catéteres registrados."),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: cateteres.length,
            itemBuilder: (context, index) {
              final cateter = cateteres[index];
              return Card(
                child: ListTile(
                  title: Text(
                    "Tipo: ${cateter.tipo ?? 'Desconocido'}", // ✅ Validación en caso de null
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Fecha de inserción: ${cateter.fechaInsercion.toString() ?? 'No registrada'}"),
                      Text("Ubicación: ${cateter.sitio ?? 'No especificada'}"),
                      Text(
                          "Fecha de retiro: ${cateter.fechaRetiro?.toString() ?? 'Aún en uso'}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditCateterPage(
                                idIngreso: idIngreso,
                                cateter: cateter,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await ref
                              .read(cateteresRepositoryProvider)
                              .eliminarCateter(
                                idIngreso,
                                cateter.id, // ✅ Asegurar que id existe
                              );

                          // 🔥 Asegurar actualización en tiempo real
                          ref.invalidate(cateteresByIngresoProvider);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Catéter eliminado")),
                          );
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
        error: (err, _) => Center(child: Text("Error: $err")),
      ),

      // 🔥 Asegurar que el botón flotante aparezca correctamente
      floatingActionButton: CreateCateterFloatingButton(idIngreso: idIngreso),
    );
  }
}
