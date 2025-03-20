import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/data/dto/create_liquido_administrado_dto.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/data/providers/liquidos_administrados_provider.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/controllers/update_liquido_administrado_controller.dart';

class UpdateLiquidoAdministradoFormbutton extends ConsumerWidget {
  final GlobalKey<FormState> _formKey;
  final String idLiquidoAdministrado;
  final TextEditingController _otherMedicamentoController; // New
  final TextEditingController _cantidadController;
  final TextEditingController _comentarioController;
  final TextEditingController _dosisController;
  final LiquidosAdministradosParams _params;
  final DateTime hora;
  final String? selectedMedicamento;

  const UpdateLiquidoAdministradoFormbutton(
      {super.key,
      required GlobalKey<FormState> formKey,
      required this.idLiquidoAdministrado,
      required TextEditingController otherMedicamentoController,
      required TextEditingController cantidadController,
      required TextEditingController comentarioController,
      required TextEditingController dosisController,
      required LiquidosAdministradosParams params,
      required this.hora,
      required this.selectedMedicamento})
      : _formKey = formKey,
        _otherMedicamentoController = otherMedicamentoController,
        _cantidadController = cantidadController,
        _comentarioController = comentarioController,
        _dosisController = dosisController,
        _params = params; // New

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(updateLiquidoAdministradoControllerProvider);

    ref.listen<AsyncValue<void>>(updateLiquidoAdministradoControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: Text(
        "CREAR LÍQUIDO ADMINISTRADO",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          final String medicamento = selectedMedicamento == 'Other'
              ? _otherMedicamentoController.text
              : selectedMedicamento!;

          final dto = CreateLiquidoAdministradoDto(
            medicamento: medicamento,
            cantidad: int.tryParse(_cantidadController.text) ?? 0,
            comentario: _comentarioController.text.isNotEmpty
                ? _comentarioController.text
                : null,
            dosis:
                _dosisController.text.isNotEmpty ? _dosisController.text : null,
            hora: hora,
            esTratamiento: false,
          );

          await ref
              .read(updateLiquidoAdministradoControllerProvider.notifier)
              .updateLiquidoAdministrado(
                _params.idIngreso,
                _params.idRegistroDiario,
                _params.idBalanceLiquidos,
                idLiquidoAdministrado,
                dto,
              );
        }
      },
    );
  }
}
