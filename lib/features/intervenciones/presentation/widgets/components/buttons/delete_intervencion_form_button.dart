import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/presentation/controllers/eliminar_intervenciones_de_registro_controller.dart';

class DeleteIntervencionFormButton extends ConsumerWidget {
  const DeleteIntervencionFormButton({
    super.key,
    required this.idIntervencion,
    required this.params,
  });

  final String idIntervencion;
  final ReporteParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(eliminarIntervencionDeRegistroControllerProvider);

    ref.listen<AsyncValue<void>>(
        eliminarIntervencionDeRegistroControllerProvider, (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      backgroundColor: Colors.pink,
      child: Text(
        "ELIMINAR INTERVENCION",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        await ref
            .read(eliminarIntervencionDeRegistroControllerProvider.notifier)
            .eliminarIntervencionDeRegistro(
              params.idIngreso,
              params.idRegistro,
              idIntervencion,
            );
      },
    );
  }
}
