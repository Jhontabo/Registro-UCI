import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/cateteres/data/repositories/cateteres_repository.dart'; // ✅ Importación correcta
import 'package:registro_uci/features/cateteres/presentation/widgets/components/buttons/create_cateter_floating_button.dart';
import 'update_cateteres_page.dart';

class ListadoCateteresPage extends ConsumerStatefulWidget {
  final String idIngreso;

  const ListadoCateteresPage({super.key, required this.idIngreso});

  @override
  _ListadoCateteresPageState createState() => _ListadoCateteresPageState();
}

class _ListadoCateteresPageState extends ConsumerState<ListadoCateteresPage> {
  @override
  Widget build(BuildContext context) {
    final cateteresAsync =
        ref.watch(cateteresByIngresoProvider(widget.idIngreso));

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
              DateTime fechaActual = DateTime.now();

              // ✅ Asegurar que fechaInsercion no sea null
              DateTime fechaInsercion = cateter.fechaInsercion ?? fechaActual;
              int diasEnUso = fechaActual.difference(fechaInsercion).inDays;

              // ✅ Convertir tipo de catéter a minúsculas y sin espacios extra
              String tipoCateter = (cateter.tipo ?? '').trim().toLowerCase();

              // 🔍 Depuración: imprimir valores en la consola
              print("Catéter: ${cateter.tipo} | Días en uso: $diasEnUso");

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tipo: ${cateter.tipo ?? 'Desconocido'}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Fecha de inserción: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                    "${cateter.fechaInsercion ?? 'No registrada'}"),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Sitio de inserción: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: cateter.sitio ?? 'No especificado'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Lugar de procedencia: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: cateter.lugarProcedencia ??
                                    'No especificado'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            const TextSpan(
                              text: "Fecha de retiro: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: "${cateter.fechaRetiro ?? 'Aún en uso'}"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$diasEnUso días",
                            style: TextStyle(
                              color: diasEnUso > 7 ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // ✅ Agregar icono de alerta si es un catéter periférico con más de 1 día
                          if (tipoCateter.contains("periférico") &&
                              diasEnUso >= 5)
                            const Icon(Icons.warning_sharp,
                                color: Colors.red, size: 24)
                          else
                            const SizedBox
                                .shrink(), // 🔹 Si no es periférico, no muestra nada

                          const SizedBox(width: 12),
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditCateterPage(
                                    idIngreso: widget.idIngreso,
                                    cateter: cateter,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              try {
                                await ref
                                    .read(cateteresRepositoryProvider)
                                    .eliminarCateter(
                                        widget.idIngreso, cateter.id);
                                ref.invalidate(cateteresByIngresoProvider);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Catéter eliminado")),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error: $e")),
                                );
                              }
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
      floatingActionButton:
          CreateCateterFloatingButton(idIngreso: widget.idIngreso),
    );
  }
}
