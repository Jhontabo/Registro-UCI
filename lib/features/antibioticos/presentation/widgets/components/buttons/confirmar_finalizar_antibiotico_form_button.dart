import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/antibioticos/presentation/controllers/finalizar_tratamiento_antibiotico_controller.dart';

class ConfirmarFinalizarAntibioticoFormButton extends ConsumerWidget {
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const ConfirmarFinalizarAntibioticoFormButton(
      {super.key,
      required this.idIngreso,
      required this.idTratamientoAntibiotico});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(finalizarTratamientoAntibioticoControllerProvider);

    ref.listen<AsyncValue<void>>(
        finalizarTratamientoAntibioticoControllerProvider, (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      backgroundColor: Colors.pink,
      child: Text(
        "FINALIZAR TRATAMIENTO",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        await ref
            .read(finalizarTratamientoAntibioticoControllerProvider.notifier)
            .finalizarTratamientoAntibiotico(
              idIngreso,
              idTratamientoAntibiotico,
            );
      },
    );
  }
}
