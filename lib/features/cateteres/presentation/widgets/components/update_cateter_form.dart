import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/features/cateteres/data/dto/update_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/providers/cateter_provider.dart';

class UpdateCateterFormButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final String idIngreso;
  final String idCateter;
  final TextEditingController tipoController;
  final TextEditingController sitioController;
  final TextEditingController fechaInsercionController;
  final TextEditingController fechaRetiroController;
  final TextEditingController lugarProcedenciaController;

  const UpdateCateterFormButton({
    super.key,
    required this.formKey,
    required this.idIngreso,
    required this.idCateter,
    required this.tipoController,
    required this.sitioController,
    required this.fechaInsercionController,
    required this.fechaRetiroController,
    required this.lugarProcedenciaController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          final dto = UpdateCateterDto(
            tipo: tipoController.text.isNotEmpty ? tipoController.text : null,
            sitio:
                sitioController.text.isNotEmpty ? sitioController.text : null,
            fechaInsercion: fechaInsercionController.text.isNotEmpty
                ? fechaInsercionController.text
                : null,
            fechaRetiro: fechaRetiroController.text.isNotEmpty
                ? fechaRetiroController.text
                : null,
            lugarProcedencia: lugarProcedenciaController.text.isNotEmpty
                ? lugarProcedenciaController.text
                : null,
          );

          try {
            await ref.read(actualizarCateterProvider((
              idIngreso: idIngreso,
              idCateter: idCateter,
              dto: dto,
            )).future);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("✅ Catéter actualizado exitosamente.")),
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
      child: const Text("ACTUALIZAR CATÉTER"),
    );
  }
}
