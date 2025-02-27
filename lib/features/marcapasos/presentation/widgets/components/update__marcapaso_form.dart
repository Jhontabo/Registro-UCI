import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/features/marcapasos/data/dto/update_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/providers/marcapasos_provider.dart';

class UpdateMarcapasoFormButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final String idIngreso;
  final String idMarcapaso;
  final TextEditingController fechaController;
  final TextEditingController modoController;
  final TextEditingController viaController;
  final TextEditingController frecuenciaController;
  final TextEditingController sensibilidadController;
  final TextEditingController salidaController;

  const UpdateMarcapasoFormButton({
    super.key,
    required this.formKey,
    required this.idIngreso,
    required this.idMarcapaso,
    required this.fechaController,
    required this.modoController,
    required this.viaController,
    required this.frecuenciaController,
    required this.sensibilidadController,
    required this.salidaController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          final dto = UpdateMarcapasoDto(
            fechaColocacion:
                fechaController.text.isNotEmpty ? fechaController.text : null,
            modo: modoController.text.isNotEmpty ? modoController.text : null,
            via: viaController.text.isNotEmpty ? viaController.text : null,
            frecuencia: int.tryParse(frecuenciaController.text),
            sensibilidad: double.tryParse(sensibilidadController.text),
            salida: double.tryParse(salidaController.text),
          );

          try {
            await ref.read(actualizarMarcapasoProvider((
              idIngreso: idIngreso,
              idMarcapaso: idMarcapaso,
              dto: dto,
            )).future);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("✅ Marcapaso actualizado exitosamente.")),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("⚠ Error al actualizar: $e")),
              );
            }
          }
        }
      },
      child: const Text("ACTUALIZAR MARCAPASO"),
    );
  }
}
