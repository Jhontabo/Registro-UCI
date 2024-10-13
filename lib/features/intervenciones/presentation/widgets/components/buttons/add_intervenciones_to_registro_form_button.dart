import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/presentation/controllers/add_intervenciones_to_registro_controller.dart';

class AddIntervencionesToRegistroFormButton extends ConsumerWidget {
  final bool enabled;
  final List<String> intervencionesIds;
  final ReporteParams params;
  const AddIntervencionesToRegistroFormButton({
    super.key,
    required this.enabled,
    required this.intervencionesIds,
    required this.params,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(agregarIntervencionesARegistroControllerProvider);

    ref.listen<AsyncValue<void>>(
        agregarIntervencionesARegistroControllerProvider, (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
        enabled: !state.isLoading,
        isLoading: state.isLoading,
        child: const Text(
          "ACEPTAR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onTap: () {
          ref
              .read(agregarIntervencionesARegistroControllerProvider.notifier)
              .agregarIntervencionesARegistro(
                params.idIngreso,
                params.idRegistro,
                intervencionesIds,
              );
        });
  }
}
