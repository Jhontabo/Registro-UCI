import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/necesidades/presentation/controllers/delete_necesidad_controller.dart';

class DeleteNecesidadFormButton extends ConsumerWidget {
  const DeleteNecesidadFormButton({
    super.key,
    required this.idNecesidad,
    required this.params,
  });

  final String idNecesidad;
  final NecesidadesParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(deleteNecesidadDeRegistroControllerProvider);

    ref.listen<AsyncValue<void>>(deleteNecesidadDeRegistroControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      backgroundColor: Colors.pink,
      child: Text(
        "ELIMINAR NECESIDAD",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        await ref
            .read(deleteNecesidadDeRegistroControllerProvider.notifier)
            .deleteNecesidadDeRegistro(
              params.idIngreso,
              params.idRegistro,
              idNecesidad,
            );
      },
    );
  }
}
