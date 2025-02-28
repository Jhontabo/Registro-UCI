import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/providers/marcapasos_provider.dart';
import 'package:registro_uci/features/marcapasos/domain/models/marcapaso.dart';
import '../pages/upddate_marcapasos_page.dart';
import '../features/marcapasos/presentation/widgets/components/buttons/create_marcapasos_floating_button.dart';

class ListadoMarcapasosPage extends ConsumerWidget {
  final String idIngreso;

  const ListadoMarcapasosPage({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marcapasosAsync = ref.watch(marcapasosByIngresoProvider(idIngreso));

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Marcapasos")),
      body: marcapasosAsync.when(
        data: (marcapasos) {
          if (marcapasos.isEmpty) {
            return const Center(
              child: Text("No hay marcapasos registrados."),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: marcapasos.length,
            itemBuilder: (context, index) {
              final marcapaso = marcapasos[index];
              return Card(
                child: ListTile(
                  title: Text(
                    "Modo: ${marcapaso.modo}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fecha: ${marcapaso.fechaColocacion}"),
                      Text("Vía: ${marcapaso.via}"),
                      Text("Frecuencia: ${marcapaso.frecuencia} BPM"),
                      Text("Sensibilidad: ${marcapaso.sensibilidad} mV"),
                      Text("Salida: ${marcapaso.salida} V"),
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
                              builder: (context) => EditMarcapasoPage(
                                idIngreso: idIngreso,
                                marcapaso: marcapaso,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await ref.read(eliminarMarcapasoProvider((
                            idIngreso: idIngreso,
                            idMarcapaso: marcapaso.id,
                          )).future);

                          // 🔥 Asegurar actualización en tiempo real
                          ref.invalidate(marcapasosByIngresoProvider);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Marcapaso eliminado")),
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
      floatingActionButton:
          CreateMarcapasosFloatingButton(idIngreso: idIngreso),
    );
  }
}
