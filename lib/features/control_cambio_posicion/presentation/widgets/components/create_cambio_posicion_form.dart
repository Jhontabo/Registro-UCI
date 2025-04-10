import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';

class CreateCambioPosicionForm extends HookConsumerWidget {
  final CambioPosicionParams params;

  const CreateCambioPosicionForm({
    super.key,
    required this.params,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final posicionController = TextEditingController();
    final horaController = TextEditingController();
    final ordenController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Formulario de posición
          TextFormField(
            controller: posicionController,
            decoration: const InputDecoration(
              labelText: 'Posición',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la posición';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Campo para hora
          TextFormField(
            controller: horaController,
            decoration: const InputDecoration(
              labelText: 'Hora (formato 24h)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la hora';
              }
              if (int.tryParse(value) == null) {
                return 'Ingrese un número válido';
              }
              final hora = int.parse(value);
              if (hora < 0 || hora > 23) {
                return 'Hora debe estar entre 0 y 23';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Campo para orden
          TextFormField(
            controller: ordenController,
            decoration: const InputDecoration(
              labelText: 'Orden',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el orden';
              }
              if (int.tryParse(value) == null) {
                return 'Ingrese un número válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          // Botón de acción (ahora solo para la visualización)
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                // Aquí podrías usar un método para obtener o mostrar los datos sin creación
                final cambio = CambioDePosicion(
                  idCambioDePosicion:
                      '', // Este ID se llenaría según la lógica de consulta
                  hora: int.parse(horaController.text),
                  posicion: posicionController.text,
                  orden: int.parse(ordenController.text),
                );

                try {
                  // Obtención de datos del provider sin crear un nuevo cambio
                  await ref.read(cambioPosicionProvider(params).future);

                  if (context.mounted) Navigator.pop(context);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                }
              }
            },
            child: const Text('Mostrar Cambio'),
          ),
        ],
      ),
    );
  }
}
