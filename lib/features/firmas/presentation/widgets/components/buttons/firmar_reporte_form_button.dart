import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/auth/data/providers/user_name_provider.dart';
import 'package:registro_uci/features/firmas/data/dto/create_firma_dto.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/firmas/presentation/controllers/firmar_reporte_controller.dart';

class FirmarReporteFormButton extends ConsumerWidget {
  final String tipoFirma; // Type of signature
  final NecesidadesParams params;

  const FirmarReporteFormButton({
    super.key,
    required this.tipoFirma,
    required this.params,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(firmarReporteControllerProvider);

    final userName = ref.watch(userNameProvider);

    ref.listen<AsyncValue<void>>(firmarReporteControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: Text(
        "Firmar Reporte",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        // Check if the tipoFirma and params are valid before proceeding
        if (tipoFirma.isNotEmpty) {
          // Assuming isValid is a method to check validity
          final dto = CreateFirmaDto(
            nombreFirma: userName ?? "",
            fechaFirma: DateTime.now(),
            // Include any additional fields from params needed for the DTO
          );

          await ref
              .read(firmarReporteControllerProvider.notifier)
              .firmarReporte(
                params.idIngreso,
                params.idRegistro,
                tipoFirma,
                dto,
              );
        } else {
          // Optionally show a message if the fields are invalid
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Por favor, verifica los datos de la firma.')),
          );
        }
      },
    );
  }
}
