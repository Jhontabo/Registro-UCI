import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';
import 'package:registro_uci/features/control_cambio_posicion/presentation/widgets/components/cambio_posicion_tile.dart';
import 'package:registro_uci/features/control_cambio_posicion/presentation/widgets/components/create_cambio_posicion_form.dart';

class CambioPosicionScreen extends ConsumerWidget {
  final CambioPosicionParams params;

  const CambioPosicionScreen({
    super.key,
    required this.params,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cambiosState = ref.watch(cambioPosicionProvider(params));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambios de Posición'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(cambioPosicionProvider(params)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Historial de Cambios',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: cambiosState.when(
                data: (cambios) => _buildList(cambios, context),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(
                  child: Text('Error: $error',
                      style: const TextStyle(color: Colors.red)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(List<CambioDePosicion> cambios, BuildContext context) {
    if (cambios.isEmpty) {
      return const Center(
        child: Text('No hay cambios registrados'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        // Puedes implementar refresh si es necesario
      },
      child: ListView.separated(
        itemCount: cambios.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final cambio = cambios[index];
          return CambioPosicionTile(
            cambio: cambio,
            params: params,
          );
        },
      ),
    );
  }

  void _showDetails(BuildContext context, CambioDePosicion cambio) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Posición: ${cambio.posicion}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem('Hora', '${cambio.hora}:00'),
              _buildDetailItem('Orden', cambio.orden.toString()),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CERRAR'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 16),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  void _showAddForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Nuevo Cambio de Posición',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              CreateCambioPosicionForm(params: params),
            ],
          ),
        ),
      ),
    );
  }
}
