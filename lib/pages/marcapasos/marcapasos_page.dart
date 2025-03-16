import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/providers/marcapasos_provider.dart';
import 'update_marcapasos_page.dart';
import '../../features/marcapasos/presentation/widgets/components/buttons/create_marcapasos_floating_button.dart';

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
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Modo: ${marcapaso.modo}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Fecha: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: marcapaso.fechaColocacion),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Vía: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: marcapaso.via),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Frecuencia: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "${marcapaso.frecuencia} BPM"),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Sensibilidad: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "${marcapaso.sensibilidad} mV"),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Salida: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "${marcapaso.salida} V"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
