import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/dto/create_cambio_posicion_dto.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';

class CreateCambioPosicionFormButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final String? selectedPosicion;
  final TextEditingController otraPosicionController;
  final TextEditingController horaController;
  final TextEditingController ordenController;
  final TextEditingController observacionesController;
  final TextEditingController responsableController;
  final CambioPosicionParams params;

  const CreateCambioPosicionFormButton({
    super.key,
    required this.formKey,
    required this.selectedPosicion,
    required this.otraPosicionController,
    required this.horaController,
    required this.ordenController,
    required this.observacionesController,
    required this.responsableController,
    required this.params,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      child: const Text("Registrar Cambio"),
      onTap: () async {
        if (formKey.currentState!.validate()) {
          final posicionFinal = selectedPosicion == 'Otra posición'
              ? otraPosicionController.text
              : selectedPosicion!;

          final dto = CreateCambioPosicionDto(
            posicion: posicionFinal,
            hora: int.parse(horaController.text),
            orden: int.parse(ordenController.text),
            observaciones: observacionesController.text.isNotEmpty
                ? observacionesController.text
                : null,
            responsable: responsableController.text.isNotEmpty
                ? responsableController.text
                : null,
          );

          try {
            // Llamamos al proveedor pasando el dto como argumento
            await ref.read(cambioPosicionProvider(params).future);

            // Verificación de mounted para evitar errores después de cerrar el contexto
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error al registrar: $e')),
              );
            }
          }
        }
      },
    );
  }
}
