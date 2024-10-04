import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/necesidades/data/dto/update_necesidad_dto.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/necesidades/presentation/controllers/update_necesidad_controller.dart';

class UpdateNecesidadFormButton extends ConsumerWidget {
  final String idNecesidad;
  final NecesidadesParams params; // Assuming this is your parameter type
  final TextEditingController nombreNecesidadController;

  const UpdateNecesidadFormButton({
    super.key,
    required this.idNecesidad,
    required this.params,
    required this.nombreNecesidadController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(updateNecesidadDeRegistroControllerProvider);

    ref.listen<AsyncValue<void>>(updateNecesidadDeRegistroControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: Text(
        "Actualizar Necesidad",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        if (nombreNecesidadController.text.isNotEmpty) {
          final dto = UpdateNecesidadDto(
            nombreNecesidad: nombreNecesidadController.text,
          );

          await ref
              .read(updateNecesidadDeRegistroControllerProvider.notifier)
              .updateNecesidadDeRegistro(
                params.idIngreso,
                params.idRegistro,
                idNecesidad,
                dto,
              );
        } else {
          // Optionally show a message if the text field is empty
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content:
                    Text('Por favor, ingresa un nombre para la necesidad.')),
          );
        }
      },
    );
  }
}
