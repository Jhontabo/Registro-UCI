import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/antibioticos/data/providers/tratamiento_antibiotico_provider.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/dias_tratamiento_tile.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/finalizar_tratamiento_antibiotico_tile.dart';

class TratamientoAntibioticoPage extends ConsumerWidget {
  final String idTratamientoAntibiotico;
  final String idIngreso;

  const TratamientoAntibioticoPage({
    super.key,
    required this.idTratamientoAntibiotico,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context, ref) {
    final antibiotico =
        ref.watch(tratamientoAntibioticoProvider(TratamientoAntibioticoParams(
      idIngreso: idIngreso,
      idTratamientoAntibiotico: idTratamientoAntibiotico,
    )));

    return antibiotico.when(
      data: (tratamientoAntibiotico) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Detalles del Tratamiento',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Title Section
                Center(
                  child: Column(
                    children: [
                      const Icon(Icons.medical_services_outlined,
                          size: 80, color: Colors.blueAccent),
                      Text(
                        tratamientoAntibiotico.antibiotico.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Card to display treatment details
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Quantity
                        ListTile(
                          leading:
                              const Icon(Icons.local_drink, color: Colors.blue),
                          title: const Text('Cantidad'),
                          subtitle: Text(
                            '${tratamientoAntibiotico.cantidad} cc',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        // Frequency
                        ListTile(
                          leading:
                              const Icon(Icons.schedule, color: Colors.blue),
                          title: const Text('Frecuencia'),
                          subtitle: Text(
                            _mapFrecuencia(
                                tratamientoAntibiotico.frecuenciaEn24h),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        // Start Date
                        ListTile(
                          leading: const Icon(Icons.calendar_today,
                              color: Colors.blue),
                          title: const Text('Fecha de Inicio'),
                          subtitle: Text(
                            DateFormat('dd/MM/yyyy')
                                .format(tratamientoAntibiotico.fechaInicio),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        // End Date
                        ListTile(
                          leading: const Icon(Icons.calendar_today_outlined,
                              color: Colors.blue),
                          title: const Text('Fecha de Fin'),
                          subtitle: Text(
                            tratamientoAntibiotico.fechaFin != null
                                ? DateFormat('dd/MM/yyyy')
                                    .format(tratamientoAntibiotico.fechaFin!)
                                : 'N/A',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        // Status
                        ListTile(
                          leading: Icon(
                            tratamientoAntibiotico.fechaFin == null
                                ? Icons.check_circle_outline
                                : Icons.cancel_outlined,
                            color: tratamientoAntibiotico.fechaFin == null
                                ? Colors.green
                                : Colors.red,
                          ),
                          title: Text(
                            tratamientoAntibiotico.fechaFin == null
                                ? 'Estado: Activo'
                                : 'Estado: Finalizado',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: tratamientoAntibiotico.fechaFin == null
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Button for any action, e.g., editing the treatment
                DiasTratamientoAntibioticoTile(
                  idIngreso: idIngreso,
                  idTratamientoAntibiotico: idTratamientoAntibiotico,
                ),
                const SizedBox(height: 10),
                FinalizarTratamientoAntibioticoTile(
                  idIngreso: idIngreso,
                  idTratamientoAntibiotico:
                      tratamientoAntibiotico.idTratamientoAntibiotico,
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      ),
      loading: () => const Scaffold(),
    );
  }

  // Helper function to map frequency to a string
  String _mapFrecuencia(int frecuenciaEn24h) {
    switch (frecuenciaEn24h) {
      case 1:
        return 'Cada 24 horas (1 al día)';
      case 2:
        return 'Cada 12 horas (2 al día)';
      case 4:
        return 'Cada 6 horas (4 al día)';
      case 6:
        return 'Cada 4 horas (6 al día)';
      case 8:
        return 'Cada 3 horas (8 al día)';
      case 12:
        return 'Cada 2 horas (12 al día)';
      case 24:
        return 'Cada hora (24 al día)';
      default:
        return '${frecuenciaEn24h}h';
    }
  }
}
