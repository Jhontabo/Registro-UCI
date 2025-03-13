import 'package:flutter/material.dart';
import 'package:registro_uci/constants/intervenciones.dart';
import 'package:registro_uci/features/intervenciones/domain/models/actividad.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/pages/resultados/resultados_de_intervencion_page.dart';

class IntervencionPage extends StatelessWidget {
  final Intervencion intervencion;
  const IntervencionPage({super.key, required this.intervencion});

  @override
  Widget build(BuildContext context) {
    final List<Actividad>? actividades =
        actividadesDeIntervencion[intervencion.idNIC];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de Intervencion"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Intervencion details with rich styling
            RichText(
              text: TextSpan(
                text: intervencion.idNIC,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: ": (${intervencion.nombre})",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // List of Activities
            Text(
              'Actividades:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: actividades == null
                  ? const Text('No activities available.')
                  : ListView.builder(
                      itemCount: actividades.length,
                      itemBuilder: (context, index) {
                        final actividad = actividades[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: const Icon(Icons.check_circle_outline,
                                color: Colors.green),
                            title: Text(actividad.descripcion),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            // Button to navigate to the Resultados page
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadosDeIntervencionPage(
                          intervencion: intervencion),
                    ),
                  );
                },
                icon: const Icon(Icons.assessment_outlined),
                label: const Text("Ver Resultados de NIC"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
