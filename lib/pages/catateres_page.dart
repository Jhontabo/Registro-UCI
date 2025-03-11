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

              // Cálculo de los días en uso de cada catéter
              DateTime fechaActual = DateTime.now();
              Duration diferencia =
                  fechaActual.difference(cateter.fechaInsercion);
              int diasEnUso = diferencia.inDays;

              return Card(
                child: ListTile(
                  title: Text(
                    "Tipo: ${cateter.tipo ?? 'Desconocido'}", // ✅ Validación en caso de null
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Mostrar la fecha de inserción sin formato
                      Text(
                          "Fecha de inserción: ${cateter.fechaInsercion ?? 'No registrada'}"),

                      // Mostrar el sitio de inserción
                      Text(
                          "Sitio de inserción: ${cateter.sitio ?? 'No especificado'}"),

                      // Mostrar el lugar de procedencia
                      Text(
                          "Lugar de procedencia: ${cateter.lugarProcedencia ?? 'No especificado'}"),

                      // Mostrar la fecha de retiro (si está disponible)
                      Text(
                          "Fecha de retiro: ${cateter.fechaRetiro ?? 'Aún en uso'}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Mostrar el ícono de reloj junto con los días en uso
                      IconButton(
                        icon:
                            const Icon(Icons.access_time, color: Colors.green),
                        onPressed: () {
                          // Acción si es necesario (puedes agregar lógica aquí si quieres)
                        },
                      ),
                      Text(
                        "$diasEnUso días", // Mostrar la cantidad de días en uso
                        style: TextStyle(
                          color: diasEnUso > 7 ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Icono de editar
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
                      // Icono de eliminar
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          // Realizamos la eliminación de manera asincrónica
                          try {
                            await ref
                                .read(cateteresRepositoryProvider)
                                .eliminarCateter(idIngreso, cateter.id);

                            // 🔥 Asegurar actualización en tiempo real
                            ref.invalidate(cateteresByIngresoProvider);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Catéter eliminado")),
                            );
                          } catch (e) {
                            // Muestra un mensaje si hay error
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: $e")),
                            );
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
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
      floatingActionButton: CreateCateterFloatingButton(
          idIngreso:
              idIngreso), // ✅ Asegurar que el botón flotante aparezca correctamente
    );
  }
}
