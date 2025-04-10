import 'package:flutter/material.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';

class SeleccionarPosicionPage extends StatelessWidget {
  final CambioPosicionParams params;
  final int horaSeleccionada;

  const SeleccionarPosicionPage({
    super.key,
    required this.params,
    required this.horaSeleccionada,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar posición para las $horaSeleccionada:00'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Aquí puedes agregar los controles para seleccionar la posición
            _buildPositionSelector(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar la selección
                _guardarSeleccion(context);
              },
              child: const Text('Guardar Posición'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionSelector() {
    // Ejemplo de selector de posición
    return DropdownButtonFormField<String>(
      items: ['Decúbito dorsal', 'Decúbito lateral', 'Prono', 'Sentado']
          .map((pos) => DropdownMenuItem(
                value: pos,
                child: Text(pos),
              ))
          .toList(),
      onChanged: (value) {
        // Manejar cambio de posición
      },
      decoration: const InputDecoration(
        labelText: 'Posición',
        border: OutlineInputBorder(),
      ),
    );
  }

  void _guardarSeleccion(BuildContext context) {
    // Lógica para guardar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Posición guardada correctamente')),
    );

    // Opcional: regresar a la página anterior
    Navigator.pop(context);
  }
}
