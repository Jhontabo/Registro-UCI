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
      appBar: AppBar(
        title: const Text("Lista de Marcapasos"),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white, // Fondo blanco
        foregroundColor: Colors.blue.shade800, // Color del texto e iconos
        iconTheme:
            IconThemeData(color: Colors.blue.shade800), // Color de iconos
      ),
      body: marcapasosAsync.when(
        data: (marcapasos) {
          if (marcapasos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medical_services,
                      size: 60, color: Colors.blue.shade300),
                  const SizedBox(height: 16),
                  Text(
                    "No hay marcapasos registrados",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: marcapasos.length,
            itemBuilder: (context, index) {
              final marcapaso = marcapasos[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
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
                            marcapaso.modo,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              marcapaso.fechaColocacion,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow("Vía", marcapaso.via),
                      _buildInfoRow(
                          "Frecuencia", "${marcapaso.frecuencia} BPM"),
                      _buildInfoRow(
                          "Sensibilidad", "${marcapaso.sensibilidad} mV"),
                      _buildInfoRow("Salida", "${marcapaso.salida} V"),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionButton(
                            icon: Icons.edit,
                            color: Colors.blue.shade800,
                            label: "Editar",
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
                          _buildActionButton(
                            icon: Icons.delete,
                            color: Colors.red.shade700,
                            label: "Eliminar",
                            onPressed: () async {
                              await ref.read(eliminarMarcapasoProvider((
                                idIngreso: idIngreso,
                                idMarcapaso: marcapaso.id,
                              )).future);

                              ref.invalidate(marcapasosByIngresoProvider);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("Marcapaso eliminado"),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.red.shade700,
                                ),
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
        loading: () => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800),
            strokeWidth: 3,
          ),
        ),
        error: (err, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 50, color: Colors.red.shade700),
              const SizedBox(height: 16),
              Text(
                "Error al cargar los datos",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$err",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          CreateMarcapasosFloatingButton(idIngreso: idIngreso),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
                fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 28),
          color: color,
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
