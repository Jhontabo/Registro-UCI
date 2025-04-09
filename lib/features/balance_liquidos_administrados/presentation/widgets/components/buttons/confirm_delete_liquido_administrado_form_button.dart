import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/providers/liquidos_administrados_provider.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/presentation/controllers/delete_liquido_administrado.dart';

class DeleteLiquidoAdministradoFormButton extends ConsumerWidget {
  const DeleteLiquidoAdministradoFormButton({
    super.key,
    required this.idLiquidoAdministrado,
    required this.params,
  });

  final String idLiquidoAdministrado;
  final LiquidosAdministradosParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(deleteLiquidoAdministradoControllerProvider);

    ref.listen<AsyncValue<void>>(deleteLiquidoAdministradoControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      backgroundColor: Colors.pink,
      child: Text(
        "ELIMINAR",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        await ref
            .read(deleteLiquidoAdministradoControllerProvider.notifier)
            .deleteLiquidoAdministrado(
              params.idIngreso,
              params.idRegistroDiario,
              params.idBalanceLiquidos,
              idLiquidoAdministrado,
            );
      },
    );
  }
}
