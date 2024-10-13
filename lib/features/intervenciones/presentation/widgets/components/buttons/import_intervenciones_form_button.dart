import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/intervenciones/presentation/controllers/import_intervenciones_de_registro_controller.dart';

class ImportIntervencionesFormButton extends ConsumerWidget {
  final String idIngreso;
  final String originRegistroId;
  final String targetRegistroId;
  final bool enabled;

  const ImportIntervencionesFormButton({
    super.key,
    required this.idIngreso,
    required this.originRegistroId,
    required this.targetRegistroId,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(importIntervencionesDeRegistroControllerProvider);

    ref.listen<AsyncValue<void>>(
        importIntervencionesDeRegistroControllerProvider, (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading && enabled,
      child: Text(
        "IMPORTAR NECESIDADES",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        // await ref.read(authControllerProvider.notifier).login(dto);
        await ref
            .read(importIntervencionesDeRegistroControllerProvider.notifier)
            .importIntervencionesFromRegistro(
              idIngreso,
              originRegistroId,
              targetRegistroId,
            );
      },
    );
  }
}
